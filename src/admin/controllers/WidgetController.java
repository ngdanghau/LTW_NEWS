package admin.controllers;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import entities.Categories;
import entities.Widgets;
import helpers.CommonHelper;
import models.CategoriesModel;


@Transactional
@Controller
@RequestMapping("/admin")
public class WidgetController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ObjectMapper mapper;
		
	/**
	 * Lấy thông tin thể loại theo level
	 * @param parent
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Categories> getCat(int parent){
		Session session = factory.getCurrentSession();
		String hql = "FROM Categories c WHERE parent = :parent"; 
		Query query = session.createQuery(hql); 
		query.setParameter("parent", parent);
		List<Categories> list = query.list();
		return list;
	}
	
	/**
	 * Lấy thông tin thể loại theo id
	 * @param cat_id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Categories getCategory(String cat_id)
	{
		try 
		{
			Session session = factory.getCurrentSession();
			String hql = "FROM Categories c "
						+ "WHERE c.id = :cat_id";
			
			Query query = session.createQuery(hql);
			query.setParameter("cat_id", Integer.parseInt(cat_id));
			List<Categories> list = query.list();
			return list.get(0);
		}
		catch(Exception ex) 
		{
			return null;
		}
	}
	
	/**
	 * lấy danh sách widget thứ tự order_widget
	 * @return
	 */
	@SuppressWarnings({ "unchecked" })
	private List<Widgets> getListWidget(){
		List<Widgets> list = null;
		try 
		{
			Session session = factory.openSession();
			String hql = "SELECT w FROM Widgets w ORDER BY w.order_widget ASC";
			Query query = session.createQuery(hql);
			list = query.list();
			session.close();
		}
		catch(Exception ex) 
		{
			list = null;
		}
		return list;
	}
	
	@RequestMapping( value="widget", method = RequestMethod.GET)
	public String index(ModelMap model){	
		List<Widgets> listWidget = getListWidget();
		
		
		List<Categories> listParent = getCat(0);
		List<CategoriesModel> list = new ArrayList<CategoriesModel>();
		for(Categories item: listParent) {
			CategoriesModel cat = new CategoriesModel();
			cat.setCategory(item);
			List<Categories> listChildren = getCat( item.getId());
			if(listChildren != null && listChildren.size() > 0) {
				cat.setChildren(listChildren);
			}
			list.add(cat);
		}
		
		model.addAttribute("listCategories", list);
		model.addAttribute("listWidget", listWidget);
		return "admin/widget";
	}
	
	@RequestMapping( value="widget", method = RequestMethod.POST)
	public ResponseEntity<JsonNode> save(ModelMap model, @RequestParam Map<String, Object> params){	
		ObjectNode objectNode = mapper.createObjectNode();
		
		List<String> errorMessage = new ArrayList<String>();
		Categories category = null;
		String title = (String) params.get("title");
		String layout = (String) params.get("layout");
		String cat_id = (String) params.get("cat_id");
		int order_widget = Integer.parseInt((String) params.get("order_widget"));
		
		if(title == null || title.trim().length() == 0) {
			objectNode.put("result", 0);
			objectNode.put("msg","Tiêu đề không được bỏ trống!");
			return new ResponseEntity<JsonNode>(objectNode, HttpStatus.OK);
		}
		
		if(layout == null || layout.trim().length() == 0) {
			objectNode.put("result", 0);
			objectNode.put("msg","Layout không được bỏ trống!");
			return new ResponseEntity<JsonNode>(objectNode, HttpStatus.OK);
		}else if(!CommonHelper.contains(new String[] { "layout-group-1", "layout-group-2", "layout-group-3", "layout-group-4", "layout-grid-1", "layout-grid-2", "layout-vertical" }, layout)) {
			objectNode.put("result", 0);
			objectNode.put("msg","Layout không hợp lệ!");
			return new ResponseEntity<JsonNode>(objectNode, HttpStatus.OK);
		}
		
		if(cat_id == null || cat_id.trim().length() == 0) {
			objectNode.put("result", 0);
			objectNode.put("msg","Thể loại không được bỏ trống!");
			return new ResponseEntity<JsonNode>(objectNode, HttpStatus.OK);
		}else {
			category = getCategory(cat_id);
			if(category == null) {
				objectNode.put("result", 0);
				objectNode.put("msg", "Thể loại không hợp lệ!");				
				return new ResponseEntity<JsonNode>(objectNode, HttpStatus.OK);
			}
		}
		
		Widgets widget = new Widgets();
		widget.setTitle(title);
		widget.setLayout(layout);
		widget.setNum_post(5);
		widget.setCategory(category);
		widget.setOrder_widget(order_widget);
		
		Session session = factory.openSession();
		Transaction t =  session.beginTransaction();
		try{   
			session.save(widget);
			t.commit();
		}
		catch(Exception e){
			e.printStackTrace();
			t.rollback();
			objectNode.put("msg", "Thêm thành công!");
		}
		finally{
			session.close();
		}
		objectNode.put("result", 1);
		return new ResponseEntity<JsonNode>(objectNode, HttpStatus.OK);
	}
}

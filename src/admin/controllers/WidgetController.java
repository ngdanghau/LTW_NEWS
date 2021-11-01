package admin.controllers;


import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import entities.Categories;
import entities.Widgets;
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
	public ResponseEntity<JsonNode> save(ModelMap model){	
		ObjectNode objectNode = mapper.createObjectNode();
		
		objectNode.put("result", 1);
		return new ResponseEntity<JsonNode>(objectNode, HttpStatus.OK);
	}
}
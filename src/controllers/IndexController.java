package controllers;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entities.Posts;
import entities.Widgets;
import models.WidgetModel;

@Transactional
@Controller
public class IndexController {
	
	/***************************************************
	 * @author Hau
	 * IndexController chuyen xu ly trang chu cua website
	 ***************************************************/
	
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public List<Posts> getListPostsByCat(int catId, int limitPost)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Posts p WHERE p.category.id = :catId"; 
		if(catId == 1) {
			hql = "FROM Posts p WHERE p.category.id != :catId";
		}
		Query query = session.createQuery(hql); 
		query.setFirstResult(0);
		query.setMaxResults(limitPost);
		query.setParameter("catId", catId);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Widgets> getListWidgets()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Widgets ORDER BY order_widget ASC"; 
		Query query = session.createQuery(hql); 
		return query.list();
	}
	
	@RequestMapping("index")
	public String index(ModelMap model){
		List<WidgetModel> lists = new ArrayList<WidgetModel>();
		List<Widgets> listWidgets = this.getListWidgets();
		for(Widgets item: listWidgets) {
			lists.add(
	    			new WidgetModel(
	    					item.getCategory(), 
	    					this.getListPostsByCat(item.getCategory().getId(), item.getNum_post()), 
	    					item.getLayout().trim()
	    			)
	    	);
		}
		model.addAttribute("listWidgets", lists);
		return "index";
	}
}

package controllers;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entities.Posts;

@Transactional
@Controller
@RequestMapping("/article/")
public class ArticleController {
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public Posts getPost(int post_id){
		Session session = factory.getCurrentSession();
		String hql = "FROM Posts WHERE id = :id"; 
		Query query = session.createQuery(hql); 
		query.setParameter("id", post_id);
		try {
			Posts post = (Posts) query.list().get(0);
			return post;
		}catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	/***************************************************
	 * @author Phong
	 * ArticleController chuyen xu ly hien thi cho mot bai viet
	 * @return
	 ***************************************************/
	
	@RequestMapping(value = "{post_id}-{post_slug}", method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable("post_id") int post_id, @PathVariable("post_slug") String post_slug){
//		Session session = factory.getCurrentSession();
//		Posts post = (Posts) session.get(Posts.class, post_id);		
		Posts post = this.getPost(post_id);
		if(post == null) {
			return "redirect:../index.htm";
		}
		DateFormat dateFormat = new SimpleDateFormat("dd MMMM, yyyy", new Locale("vi", "VN"));
		model.addAttribute("dateFormat", dateFormat);
		model.addAttribute("post", post);
		return "client/article";
	}
}

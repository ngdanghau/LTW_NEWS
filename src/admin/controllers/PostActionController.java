package admin.controllers;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entities.Posts;


@Transactional
@Controller
@RequestMapping("/admin")
public class PostActionController {
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public Posts getPostById(int postid){
		Session session = factory.getCurrentSession();
		String hql = "SELECT p FROM Posts p WHERE p.id = :postid"; 
		Query query = session.createQuery(hql); 
		query.setParameter("postid", postid);
		
		List<Posts> list = query.list();
		
		try 
		{
			return list.get(0);
		}catch(Exception ex) {
			return null;
		}
	}
	
	@RequestMapping( value="post_delete", method = RequestMethod.GET)
	public String index(HttpServletRequest request, ModelMap model){	
		int postId = 0;
		try {
			postId = Integer.parseInt(request.getParameter("postid"));
		}catch(Exception ex) {
			postId = 0;
		}
		
		if(postId == 0) {
			return "redirect:/admin/posts.htm";
		}
		
		List<String> errorMessage = new ArrayList<String>();
		Posts post = getPostById(postId);
		if(post == null) {
			errorMessage.add("Bài viết không tồn tại !");
		}else {
			Session session = factory.openSession();
			Transaction t =  session.beginTransaction();
			try{   
				post.setPost_status("trash");
				session.update(post);
				t.commit();
				request.getSession().setAttribute("successMessage", "Xóa bài viết thành công");
			}
			catch(Exception e){
				e.printStackTrace();
				t.rollback();
				errorMessage.add("Xóa bài viết thất bại !");
			}
			finally{
				session.close();
			}
		}
		
		if(errorMessage.size() > 0) {
			return "redirect:/admin/post.htm?postid=" + postId;
		}
		request.getSession().setAttribute("successMessage", "Xóa bài viết thành công");
		return "redirect:/admin/posts.htm";
	}
}

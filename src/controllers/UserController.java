package controllers;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import entitys.*;

@Transactional
@Controller
@RequestMapping("/user/")
public class UserController{
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpServletRequest request){
		String message = request.getParameter("message");
		model.addAttribute("users", getUser());
		model.addAttribute("message", message);
		return "user/index";
	}

	public List<Users> getUser(){
		Session session = factory.getCurrentSession();
		String hql = "FROM Users"; 
		Query query = session.createQuery(hql); 
		@SuppressWarnings("unchecked")
		List<Users> list = query.list();
		return list;
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model){
		model.addAttribute("user", new Users());
		return "user/insert";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("user") Users user){
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try{
			session.save(user);
			t.commit();
			model.addAttribute("message", "Thêm mới thành công !");
		}
		catch(Exception e){
			t.rollback();
			model.addAttribute("message", "Thêm mới thất bại !");
		}
		finally{
			session.close();
		}
		return "user/insert";
	}
	
	
	@RequestMapping(value = "update/{username}", method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable("username") String username){
		Session session = factory.getCurrentSession();
		Users user = (Users) session.get(Users.class, username);
		model.addAttribute("user", user);
		model.addAttribute("username", username);
		return "user/update";
	}
	
	@RequestMapping(value="update/{username}", method=RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("user") Users user){
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.update(user);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công !");
		}
		catch(Exception e){
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại !");
		}
		finally{
			session.close();
		}
		return "user/update";
	}
	
	
	@RequestMapping("delete/{username}")
	public String delete(ModelMap model, @ModelAttribute("user") Users user){
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.delete(user);
			t.commit();
			model.addAttribute("message", "Xóa thành công !");
		}
		catch(Exception e){
			t.rollback();
			model.addAttribute("message", "Xóa thất bại!");
		}
		finally{
			session.close();
		}
		return "redirect:../../user/index.htm";
	}
}
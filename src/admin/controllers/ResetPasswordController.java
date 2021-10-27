package admin.controllers;


import java.util.List;


import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import entities.Users;

@Controller
public class ResetPasswordController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value="/reset-password/{hash}")
	public String retrievePassword(@PathVariable("hash") String hash,ModelMap model)
	{
		String array[] = hash.split("_");
		String id = array[0];
		String token = array[1];
		System.out.println(id+token);
		Users user = getUser(id);
		if(user==null)
		return "admin/404";
		
		if(user.getData().compareTo(token)==0)
		{
			model.addAttribute("hash",hash);
			return "admin/reset-password";
		}
		else
		return "admin/404";
	}
	
	@RequestMapping(value="/reset-password/{hash}",method=RequestMethod.POST)
	public String changePassword(ModelMap model,@RequestParam("password") String password,
			@RequestParam("repeatpassword") String repeatpassword,ModelMap modelMap,@PathVariable("hash") String hash)
	{
		if(password.compareTo(repeatpassword)!=0)
		{
			model.addAttribute("message", "Mật khẩu và mật khẩu nhập lại không trùng nhau!");
			model.addAttribute("hash", hash);
			return "admin/reset-password";
		}
		String array[] = hash.split("_");
		String id = array[0];
		String token = array[1];
		Users user = getUser(id);
		if(user.getData().compareTo(token)==0)
		{
			String encryptedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));
			System.out.println("Password: " + password);
			System.out.println("BCrypt hash: " + encryptedPassword);
			user.setPassword(encryptedPassword);
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.update(user);
				t.commit();
			}catch (Exception ex)
				{
					t.rollback();
					System.out.println(ex);
					return "admin/404";
				}
			return "redirect:/index.htm";
		}
		else
		return "admin/404";
	}
	
	
	public Users getUser(String userid)
	{
		try 
		{
			/*Step 1*/
			Session session = factory.openSession();
			String hql = "SELECT u FROM Users u "
						+ "WHERE u.id = :userid";
			
			/*Step 2*/
			Query query = session.createQuery(hql);
			query.setParameter("userid", Integer.parseInt(userid));
			
			
			/*Step 3*/
			Users user = (Users)query.uniqueResult();
			return user;

		}
		catch(Exception ex) 
		{
			System.out.println(ex);
			return null;
		}
	}
}

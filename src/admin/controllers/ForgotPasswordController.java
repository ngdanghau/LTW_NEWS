package admin.controllers;

import java.sql.SQLException;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import bean.Mailer;
import entities.Users;

@Controller
@RequestMapping("/forgot-password")
public class ForgotPasswordController {
	@Autowired
	SessionFactory factory;
	@Autowired
	Mailer mailer;
		
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model){	
		
		
		return "admin/forgot-password";
	}
	
	@Transactional
	@RequestMapping(method = RequestMethod.POST)
	public String ForgotPassword(ModelMap model, @ModelAttribute("email") String email)
	{
		if(email.isEmpty())
		{
			model.addAttribute("message", "Không được để trống email");
			return "admin/forgot-password";
		}
		if(email.length()<15)
		{
			model.addAttribute("message", "Email không hợp lệ");
			return "admin/forgot-password";
		}
		
		Session session = factory.getCurrentSession();
		String hql = "SELECT u FROM Users u WHERE u.email = :email"; 
		Query query = session.createQuery(hql); 
		query.setParameter("email", email);
		
		try {
			Users user = (Users)query.uniqueResult();
			String userEmail = user.getEmail();
			if(userEmail==null)
			model.addAttribute("message", "Email không tồn tại");
			else
			{
				String hash = user.getId()+"_"+updateToken(user);
				if(hash==null)
				throw new Exception("Update thất bại");
				mailer.send(mailer.from(),userEmail,mailer.retrievePasswordSubject(), mailer.bodyRP(hash));	
				model.addAttribute("message", "Vui lòng xác nhận cấp lại mật khẩu trong Email");
			}
		}catch(Exception ex){			
			System.out.println(ex);
			return "admin/404";
		}
		return "admin/forgot-password";
	}
	
	public String updateToken(Users user)
	{
		String token =Long.toHexString(Double.doubleToLongBits(Math.random())); // HÀM TẠO RANDOM HASH ĐỂ LẤY LẠI MẬT KHẨU
		user.setData(token);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(user);
			t.commit();
		}catch (Exception ex)
			{
				t.rollback();
				System.out.println(ex);
				return null;
			}
		return token;
	}
	
	
}

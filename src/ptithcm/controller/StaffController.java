package ptithcm.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import ptithcm.entity.*;

@Transactional
@Controller
@RequestMapping("/staff/")
public class StaffController {

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("index")
	public String index(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM Staffs"; 
		Query query = session.createQuery(hql); 
		List<Staffs> list = query.list();
		model.addAttribute("staffs", list);
		return "staff/index";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("report")
	public String report(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "SELECT r.staff.id," + 
				" SUM(case when r.type=1 then 1 else 0 end)," + 
				" SUM(case when r.type=0 then 1 else 0 end)" + 
				" FROM Records r" + 
				" GROUP BY r.staff.id";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		model.addAttribute("arrays", list);
		return "staff/report";
	}
}

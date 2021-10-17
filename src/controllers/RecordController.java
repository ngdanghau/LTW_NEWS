package controllers;

import java.util.Date;
import java.util.List;

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

import entitys.Records;
import entitys.Staffs;

@Transactional
@Controller
@RequestMapping("/record/")
public class RecordController {
	@Autowired
	SessionFactory factory;
	

	@SuppressWarnings("unchecked")
	@RequestMapping("index")
	public String index(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM Records"; 
		Query query = session.createQuery(hql); 
		List<Staffs> list = query.list();
		model.addAttribute("records", list);
		return "record/index";
	}
	
	
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("record", new Records());
		model.addAttribute("staffs", getStaffs());
		return "record/insert";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("record") Records record) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
	
		try {
			record.setDate(new Date());
			session.save(record);
			t.commit();
			model.addAttribute("message", "Thêm mới thành công !");
			
		}
		catch(Exception e) {
			t.rollback();
			model.addAttribute("message","Thêm mới thất bại !");
			
		}
		finally {
			session.close();
		}
		
		return "record/insert";
	}
	
	@SuppressWarnings("unchecked")
	@ModelAttribute("Staffs")
	public List<Staffs> getStaffs(){
		Session session=factory.getCurrentSession();
		String hql="FROM Staffs";
		Query query=session.createQuery(hql);
		List<Staffs> list = query.list();
		return list;
	}
	
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(ModelMap model) {
		model.addAttribute("record", new Records());
		return "record/delete";
	}
	
	@RequestMapping("delete/{Id}")
	public String delete(ModelMap model, @ModelAttribute("record") Records record){
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try{
			session.delete(record);
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
		return "redirect:../../record/index.htm";
	}
	
	@RequestMapping(value="update/{recordId}", method=RequestMethod.GET)
	public String update(ModelMap model, @PathVariable("recordId") long Id) {
		Session session = factory.getCurrentSession();
		Records record = (Records) session.get(Records.class, Id);
		model.addAttribute("record", record);
		model.addAttribute("staffs", getStaffs());
		model.addAttribute("Id", Id);
		return "record/update";
	}
	
	
	@RequestMapping(value="update/{recordId}", method=RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("record") Records record) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			record.setDate(new Date());
			session.update(record);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công !");
			
		}
		catch(Exception e) {
			t.rollback();
			model.addAttribute("message","Cập nhật thất bại !");
			
		}
		finally {
			session.close();
		}
		
		return "record/update";
	}
}

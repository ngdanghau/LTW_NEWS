package controllers;


import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entities.*;

@Transactional
@Controller
public class InformationPageController {

	
	@Autowired
	SessionFactory factory;
	
	/* **************************************************
	 * @author Phong
	 * 
	 * InformationPageController de xu ly cac trang thong tin ngoai le nhu: 
	 * ABOUT, HELP, PRIVACY, TERMS,CONTACT
	 * ***************************************************/
	@RequestMapping("informationPage")
	public String informationPage()
	{
		return "client/informationPage";
	}
	
	
	
	/**************************************************
	 * @author Phong
	 * 
	 * Step 1: khoi tao session va cau lenh truy van
	 * Step 2: gan dieu kien truy van cho cau lenh
	 * Step 3: thuc hien truy van va dung @ModelMap tra ve ket qua dau tien tim thay
	 * 
	 * @return
	 **************************************************/
	@RequestMapping(value="page/{slug}", method = RequestMethod.GET)
	public String retrievePageBySlug(ModelMap modelMap, @PathVariable("slug") String slug)
	{
		/*Step 1*/
		Session session = factory.getCurrentSession();
		String hql = "FROM Pages WHERE Page_Slug = :slug";
		
		/*Step 2*/
		Query query = session.createQuery(hql);
		query.setParameter("slug", slug);
		
		
		/*Step 3*/
		List<Pages> list = query.list();
		modelMap.addAttribute("page", list.get(0));
		
		
		return "client/informationPage";
	}
}

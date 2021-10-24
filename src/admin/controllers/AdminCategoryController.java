package admin.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entities.Categories;

@Transactional
@Controller
@RequestMapping("/admin")
public class AdminCategoryController {
	
	@Autowired
	SessionFactory factory;
	
	
	
	
	/**************************************************
	 * @author Phong
	 * 
	 * PAGINATION
	 * setMaxLinkedPages(3) ngoai trang hien tai thi co 3 trang khac duoc hien thi
	 * setPageSize(8) coi 8 bai viet o moi trang
	 * 
	 * Step 1: khoi tao cau truy van
	 * Step 2: thuc hien cau truy van
	 * Step 3: tra ve ket qua
	 * 
	 * @return liet ke tat cac cac the loai
	 **************************************************/
	@RequestMapping("category")
	public String retrieveCategory(HttpServletRequest request, ModelMap modelMap )
	{
		/*Step 1*/
		Session session = factory.getCurrentSession();
		String hql = "FROM Categories";
		
		
		/*Step 2*/
		Query query = session.createQuery(hql);
		List<Categories> list = query.list();
		
		
		
		/*PAGINATION*/
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(8);
		
		
		
		/*Step 3*/
		modelMap.addAttribute("category", list);
		modelMap.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/category";
	}
	
	
	
	/**************************************************
	 * @author Phong
	 * 
	 * Step 1: khoi tao bien new Categories();
	 * Step 2: truyen bien vao ModelMap & goi view
	 * 
	 * GET: add-category
	 * 
	 * @return mo form them moi the loai
	 **************************************************/
	@RequestMapping(value="add-category", method=RequestMethod.GET)
	public String addCategory(ModelMap modelMap)
	{
		/*Step 1*/
		Categories category = new Categories();
		
		
		/*Step 2*/
		modelMap.addAttribute("category", category);
		return "admin/categoryAdd";
	}
	
	
	/**************************************************
	 * @author Phong
	 * 
	 * Step 1: khoi tao phien lam viec voi du lieu. 
	 * Do phai thay doi co so du lieu nen dung beginTransaction() thay vi getCurrentSession()
	 * 
	 * Step 2: doi tuong vua duoc them vao. 
	 * 
	 * Step 3: tra ve ket qua thanh cong
	 * 
	 * POST: add-category
	 * 
	 * @return mo form them moi the loai
	 **************************************************/
	@RequestMapping(value="add-category", method=RequestMethod.POST)
	public String addCategory(ModelMap modelMap, @ModelAttribute("category") Categories cat)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try 
		{
			
			session.save(cat);
			t.commit();
			/* modelMap.addAttribute("message", "Them moi thanh cong"); */
		}
		catch(Exception ex)
		{
			t.rollback();
			return null;
			/* modelMap.addAttribute("message", "Them moi that bai"); */
		}
		finally
		{
			session.close();
		}
		
		return "redirect:/admin/category.htm";
	}
}

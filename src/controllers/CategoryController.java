package controllers;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entities.Categories;
import entities.Posts;

@Transactional
@Controller
public class CategoryController {

	@Autowired
	SessionFactory factory;
	
	
	
	@RequestMapping("category")
	public String category()
	{
		return "client/category";
	}
	
	
	
	/*************************************************
	 * @author Phong
	 * Step 1: khoi tao cau truy van
	 * Step 2: gan dieu kien cho cau truy van
	 * Step 3: tra ket qua ve
	 * Step 4: gan ket qua vao @ModelMap de tra ra view
	 * @return lay ra cac bai viet theo theo loai @param slug
	 *************************************************/
	
	@RequestMapping(value="category/{slug}", method=RequestMethod.GET)
	public String retrieveArticlesByCategory(ModelMap modelMap, @PathVariable("slug") String slug)
	{
		/*Step 1*/
		Session session = factory.getCurrentSession();
		
		String hql = "SELECT p "
				+ "FROM Categories c, Posts p, Cat_Post cp "
				+ "WHERE cp.category.id = c.id "
				+ "AND cp.post.id = p.id "
				+ "AND c.slug = :slug";
		
		
		/*Step 2*/
		Query query = session.createQuery(hql);
		query.setParameter("slug", slug);
		
		
		/*Step 3*/
		List<Posts> list = query.list();
		Categories category = retrieveCategory(slug);
		
		
		/*Step 4*/
		modelMap.addAttribute("categoryPost", list);
		modelMap.addAttribute("category", category);
		return "client/category";
	}
	
	
	
	/*********************************************
	 * @author Phong
	 * @param slug | String | ten cua the loai dang SEO. Vi du: the-gioi, am-nhac,..
	 * @return tra ve ban ghi chua day du thong tin cua the loai co @param slug
	 * 
	 * Step 1: khoi tao cau truy van
	 * Step 2: gan dieu kien
	 * Step 3: tra ve ket qua
	 * 
	 * du lieu do vao /WEB-INF/views/client/category.jsp
	 *********************************************/
	
	@ModelAttribute("category")
	public Categories retrieveCategory(String slug)
	{
		try 
		{
			/*Step 1*/
			Session session = factory.getCurrentSession();
			String hql = "FROM Categories c "
						+ "WHERE c.slug = :slug";
			
			
			/*Step 2*/
			Query query = session.createQuery(hql);
			query.setParameter("slug", slug);
			
			
			/*Step 3*/
			List<Categories> list = query.list();
			return list.get(0);
		}
		catch(Exception ex) 
		{
			return null;
		}
	}
	
	
	
	/**************************************************
	 * @author Phong
	 * 
	 * Step 1: khoi tao cau truy van
	 * Step 2: gan dieu kien
	 * Step 3: tra ve ket qua
	 * 
	 * @return lay ra nhung bai viet co nhieu luot xem nhat
	 * 
	 * du lieu nay do vao /WEB-INF/views/client/fragment/sidebar.fragment.jsp
	 **************************************************/
	
	@ModelAttribute("mostPopularArticle")
	public List<Posts> retriveMostPopularArticle()
	{
		/*Step 1*/
		Session session = factory.getCurrentSession();
		String hql = "FROM Posts p "
				+ "ORDER BY p.viewer DESC";
		
		/*Step 2*/
		Query query = session.createQuery(hql);
		List<Posts> list = query.list();
		
		/*Step 3*/
		return list;
	}
}

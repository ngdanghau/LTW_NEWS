package interceptors;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fasterxml.jackson.databind.ObjectMapper;

import entities.General_Data;
import entities.Menu;
import entities.Posts;
import models.MenuModel;
import models.SettingsData;

@Transactional
public class GlobalInterceptor extends HandlerInterceptorAdapter  {
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public List<Menu> getMenu(int position, int parent){
		Session session = factory.getCurrentSession();
		String hql = "FROM Menu m WHERE parent = :parent AND position = :position ORDER BY m.order_menu ASC"; 
		Query query = session.createQuery(hql); 
		query.setParameter("parent", parent);
		query.setParameter("position", position);
		List<Menu> list = query.list();
		return list;
	}
	
	public void setMenu(HttpServletRequest request) 
	{
		// get Menu
		List<Menu> listParent = getMenu(0, 0);
		
		List<MenuModel> list = new ArrayList<MenuModel>();
		
		for(Menu item: listParent) {
			MenuModel menu = new MenuModel();
			menu.setMenu(item);
			List<Menu> listChildren = getMenu(0, item.getId());
			if(listChildren != null && listChildren.size() > 0) {
				menu.setChildren(listChildren);
			}
			list.add(menu);
		}
		request.setAttribute("listMenuHeader", list);
		
		
		List<Menu> listMenuFooter = getMenu(1, 0);
		request.setAttribute("listMenuFooter", listMenuFooter);
	}
	
	public void setAppUrl(HttpServletRequest request) {
		// set path 
		String APPURL = String.format("%s://%s:%s%s", request.getScheme(), request.getServerName(), request.getServerPort(), request.getContextPath() );
		request.setAttribute("APPURL", APPURL);
		
		String HOMEURL = String.format("%s://%s:%s%s/index.htm", request.getScheme(), request.getServerName(), request.getServerPort(), request.getContextPath() );
		request.setAttribute("HOMEURL", HOMEURL);
		
	}
	
	
	public SettingsData getGeneralData(String name) {
		ObjectMapper mapper = new ObjectMapper();
		Session session = factory.getCurrentSession();
		String hql = String.format("FROM General_Data WHERE name = :name"); 
		Query query = session.createQuery(hql); 
		query.setParameter("name", name); 
		try {
			General_Data json = (General_Data) query.list().get(0);
			return mapper.readValue(json.getData(), SettingsData.class);
		}catch(Exception ex) {
			return null;
		}
	}
	
	public void setGeneralData(HttpServletRequest request) {
		request.setAttribute("SettingsData", getGeneralData("settings"));
		request.setAttribute("SocialData", getGeneralData("social"));
	}
	
	public void setCurrentYear(HttpServletRequest request) {
		Date date = new Date();  
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		int year = calendar.get(Calendar.YEAR);  
		request.setAttribute("currentYear", year);
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception{
		setMenu(request);
		setAppUrl(request);
		setGeneralData(request);
		setCurrentYear(request);
		
		return true;
	}
	
	
	
}
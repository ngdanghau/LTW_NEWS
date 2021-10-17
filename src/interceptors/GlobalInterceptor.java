package interceptors;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import entities.Menu;
import models.MenuModel;

@Transactional
public class GlobalInterceptor extends HandlerInterceptorAdapter  {
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public List<Menu> getMenu(int position, int parent){
		Session session = factory.getCurrentSession();
		String hql = String.format("FROM Menu m WHERE parent = %d AND position = %d ORDER BY m.order_menu ASC", parent, position); 
		Query query = session.createQuery(hql); 
		List<Menu> list = query.list();
		return list;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception{
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
		
		request.setAttribute("list", list);
	
		return true;
	}
}

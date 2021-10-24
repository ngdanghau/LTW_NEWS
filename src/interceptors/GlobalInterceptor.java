package interceptors;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fasterxml.jackson.databind.ObjectMapper;

import entities.General_Data;
import entities.Users;
import models.SettingsData;

@Transactional
public class GlobalInterceptor extends HandlerInterceptorAdapter  {
	@Autowired
	SessionFactory factory;
	
	/**************************************************
	 * @author Hau
	 * 
	 * @return tra ve duong dan cua trang
	 * 
	 * APPURL: http://localhost:8080/LTW_NEWS/
	 * HOMEURL http://localhost:8080/LTW_NEWS/index.htm
	 **************************************************/
	public void setAppUrl(HttpServletRequest request) {
		// set path 
		String APPURL = String.format("%s://%s:%s%s", request.getScheme(), request.getServerName(), request.getServerPort(), request.getContextPath() );
		request.setAttribute("APPURL", APPURL);
		
		String HOMEURL = String.format("%s://%s:%s%s/index.htm", request.getScheme(), request.getServerName(), request.getServerPort(), request.getContextPath() );
		request.setAttribute("HOMEURL", HOMEURL);
		
		String ADMINURL = String.format("%s://%s:%s%s/admin", request.getScheme(), request.getServerName(), request.getServerPort(), request.getContextPath() );
		request.setAttribute("ADMINURL", ADMINURL);
		
	}
	
	
	/**************************************************
	 * @author Hau
	 * 
	 * @return lay du lieu chung
	 **************************************************/
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
	
	
	
	
	/**************************************************
	 * @author Hau
	 * 
	 * @return lay cac cai dat tong quat 
	 **************************************************/
	public void setGeneralData(HttpServletRequest request) {
		request.setAttribute("SettingsData", getGeneralData("settings"));
		request.setAttribute("SocialData", getGeneralData("social"));
	}
	
	
	
	/**************************************************
	 * @author Hau
	 * 
	 * @return lay nam hien tai
	 **************************************************/
	public void setCurrentYear(HttpServletRequest request) {
		Date date = new Date();  
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		int year = calendar.get(Calendar.YEAR);  
		request.setAttribute("currentYear", year);
	}
	
	
	@SuppressWarnings("unchecked")
	public void setAuthUser(HttpServletRequest request) {
		Principal userPrincipal = (Principal) request.getUserPrincipal();
		Users AuthUser = null;
		if(userPrincipal != null) {
			try 
			{
				Session session = factory.getCurrentSession();
				String hql = "FROM Users u "
							+ "WHERE u.email = :email";
				
				Query query = session.createQuery(hql);
				query.setParameter("email", userPrincipal.getName());
				
				List<Users> list = query.list();
				AuthUser = list.get(0);
			}
			catch(Exception ex) 
			{
				AuthUser = null;
			}
			
		}
		request.setAttribute("AuthUser", AuthUser);
	}
	

	/**
	 * Hàm để khai báo một biến Date Format chung cho toàn bộ web
	 * @param request
	 */
	public void setDateFormat(HttpServletRequest request) {
		DateFormat dateFormat = new SimpleDateFormat("dd MMMM, yyyy", new Locale("vi", "VN"));
		request.setAttribute("dateFormat", dateFormat);
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception{
		setAppUrl(request);
		setGeneralData(request);
		setCurrentYear(request);
		setDateFormat(request);	
		setAuthUser(request);
		return true;
	}
}

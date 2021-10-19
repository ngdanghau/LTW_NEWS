package interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthorizeInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception{
		HttpSession session = request.getSession();
		
		if(session.getAttribute("user") == null)
		{
			response.sendRedirect(request.getContextPath() + "/user/login.htm");
			return false;
		}
		return true;
	}
}

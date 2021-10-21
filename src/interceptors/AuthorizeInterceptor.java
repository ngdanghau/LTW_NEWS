package interceptors;

import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AuthorizeInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception{
//		Principal principal = (Principal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		if(principal == null)
//		{
//			response.sendRedirect(request.getContextPath() + "/admin.htm");
//			return false;
//		}
		return true;
	}
}

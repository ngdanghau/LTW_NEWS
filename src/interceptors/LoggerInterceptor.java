package interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception{
		System.out.println("LoggerInterceptor.preHandle()");
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object Handler, ModelAndView modelAndView) throws Exception{
		System.out.println("LoggerInterceptor.postHandle()");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object Handler, Exception ex) throws Exception{
		System.out.println("LoggerInterceptor.afterCompletion()");
	}
}

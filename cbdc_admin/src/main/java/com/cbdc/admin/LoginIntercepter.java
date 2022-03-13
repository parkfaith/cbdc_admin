package com.cbdc.admin;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoginIntercepter implements HandlerInterceptor{

	private static final Logger LOG = LoggerFactory.getLogger(LoginIntercepter.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HashMap<String,Object> userInfoMap = (HashMap<String, Object>) request.getSession().getAttribute("USER_INFO");
		if(userInfoMap == null) {
			LOG.debug("[>] SESSION ==========>>>  CHECK POINT");
			response.sendRedirect(request.getContextPath()+"/");
			return false;
			
		} else {
			LOG.debug("[>] SESSION ==========>>>  OK");

			String uri = request.getRequestURI();	
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		HashMap<String,Object> userInfoMap = (HashMap<String, Object>) request.getSession().getAttribute("USER_INFO");
		
	}
	
	@Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    	//do nothing
    }
}

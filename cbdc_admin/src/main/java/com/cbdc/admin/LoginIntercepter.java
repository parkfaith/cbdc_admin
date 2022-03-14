package com.cbdc.admin;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cbdc.admin.service.LoginService;

@Component
public class LoginIntercepter implements HandlerInterceptor{

	private static final Logger LOG = LoggerFactory.getLogger(LoginIntercepter.class);
	
	@Autowired
	LoginService loginService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HashMap<String,Object> userInfoMap = (HashMap<String, Object>) request.getSession().getAttribute("USER_INFO");
		if(userInfoMap == null) {
			LOG.debug("[>] SESSION ==========>>>  CHECK POINT");
			response.sendRedirect(request.getContextPath()+"/");
			//resultHandle = false;
			return false;
			
		} else {
			LOG.debug("[>] SESSION ==========>>>  OK");

			String uri = request.getRequestURI();
			
			if(uri.contains(".do")) {
				request.getSession().setAttribute("MENU_URL", uri);
				HashMap<String,Object> activeParam = new HashMap<String,Object>();
				activeParam.put("menuUrl", uri);
				loginService.selectMenuInfo(activeParam);
			}
			
		}
		return true;
		//return resultHandle;
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

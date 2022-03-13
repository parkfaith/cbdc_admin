package com.cbdc.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cbdc.admin.service.LoginService;

@Controller
public class LoginController {

	private static final Logger LOG = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping(value="/")
	public ModelAndView loginPage(@RequestParam HashMap<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		LOG.debug("paramMap :: " + paramMap.toString());
		return new ModelAndView("login/loginPage");	
	}
	
	@RequestMapping(value = "/login/loginProc.do")
	public ModelAndView loginProcPage(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HashMap<String, Object> userInfoMap = (HashMap<String, Object>) request.getSession().getAttribute("USER_INFO");
		if (userInfoMap != null) {
			paramMap.put("userId", userInfoMap.get("USER_ID"));
		}

		return loginProc(paramMap, request, response);
	}
	
	private ModelAndView loginProc(HashMap<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		try {
			/* IP 추출 */
			HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String ip = req.getHeader("X-FORWARDED-FOR");
			if (ip == null) {
				ip = req.getRemoteAddr();
			}
			
			HashMap<String,Object> userInfoMap = loginService.selectLoginInfo(paramMap);
			if(userInfoMap == null) {
				mav.setViewName("redirect:"+request.getContextPath()+"/");
				return mav;
			}else{
				//로그인 성공
				request.getSession().setAttribute("USER_INFO", userInfoMap);
				/* 접속로그 적재 */
				HashMap<String,Object> logMap = new HashMap<String,Object>();
				logMap.put("userId", userInfoMap.get("USER_ID"));
				logMap.put("userNm", userInfoMap.get("USER_NM"));
				logMap.put("userIp", ip);
				logMap.put("logTy", "I"); // I : Login, O : LogOut, F : LoginFail
				loginService.insertLoginLog(logMap);
				
				/* 최종접속기록 */
				loginService.updateLastAccessInfo(logMap);
				
				mav.setViewName("redirect:"+request.getContextPath()+"/dashboardPage.do");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			LOG.warn(e.getMessage(), e);
			mav.setViewName("redirect:" + request.getContextPath() + "/");
			return mav;
			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/login/loginOutProc.do")
	public ModelAndView loginOutProc(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> userInfoMap = (HashMap<String, Object>) request.getSession().getAttribute("USER_INFO");

		/* 접속로그 적재 */
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if (ip == null) {
			ip = req.getRemoteAddr();
		}

		HashMap<String, Object> logMap = new HashMap<String, Object>();
		logMap.put("userId", userInfoMap.get("USER_ID"));
		logMap.put("userNm", userInfoMap.get("USER_NM"));
		logMap.put("userIp", ip);
		logMap.put("logTy", "O"); // I : Login, O : LogOut, F : LoginFail
		loginService.insertLoginLog(logMap);

		/* 세션만료 처리 */
		request.getSession().invalidate();

		mav.setViewName("redirect:"+request.getContextPath()+"/");
		return mav;
	}
}

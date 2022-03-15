package com.cbdc.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cbdc.admin.service.LoginService;

@Controller
public class LoginController {

	private static final Logger LOG = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/")
	public ModelAndView loginPage(@RequestParam HashMap<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		LOG.debug("paramMap :: " + paramMap.toString());
		HashMap<String, Object> userInfoMap = (HashMap<String, Object>) request.getSession().getAttribute("USER_INFO");
		if (userInfoMap != null) {
			mav.setViewName("redirect:"+request.getContextPath()+"/dashboardPage.do");
		}else {
			//return new ModelAndView("login/loginPage");	
			mav.setViewName("login/loginPage");
		}
		return mav;
	}
	/**
	 * 로그인
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
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
				String passData = paramMap.get("userPwd").toString(); 
				String dbPassData =userInfoMap.get("USER_PWD").toString();
				System.out.println("asfdas========"+passwordEncoder.encode("test3"));
				if(passwordEncoder.matches(passData, dbPassData)) {
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
					
					if("Y".equals(userInfoMap.get("FIRST_LOGIN"))) {
						mav.setViewName("redirect:"+request.getContextPath()+"/passwordChange.do");
						return mav;
					}
					
					mav.setViewName("redirect:"+request.getContextPath()+"/dashboardPage.do");
				}else {
					mav.setViewName("redirect:"+request.getContextPath()+"/");
					return mav;
				}
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			LOG.warn(e.getMessage(), e);
			mav.setViewName("redirect:" + request.getContextPath() + "/");
			return mav;
			
		}
		
		return mav;
	}
	/**
	 * 로그 아웃 처리
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
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
	/**
	 * 최초 로그인 시 비밀번호 변경
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/passwordChange.do")
	public ModelAndView passwordChangeForm(@RequestParam HashMap<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		LOG.debug("passwordChange paramMap :: " + paramMap.toString());
		HashMap<String, Object> userInfoMap = (HashMap<String, Object>) request.getSession().getAttribute("USER_INFO");
		
		mav.setViewName("login/passwordChange");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/passwordChange.json", method = RequestMethod.POST)
	public Map<String, Object> passwordChange(@RequestParam HashMap<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response) {
		LOG.debug("paramMap :: " + paramMap.toString());
		HashMap<String, Object> userInfoMap = (HashMap<String, Object>) request.getSession().getAttribute("USER_INFO");

		int result = 0;

		try {
			String nowPass = paramMap.get("nowPass").toString();
			String dbPassData =userInfoMap.get("USER_PWD").toString();
			if(passwordEncoder.matches(nowPass, dbPassData)) {
				String checkPass = paramMap.get("checkPass").toString();
				paramMap.put("checkPass", passwordEncoder.encode(checkPass));
				paramMap.put("logUserId", userInfoMap.get("USER_ID"));
				
				result = loginService.updatePassword(paramMap);
				result = 200;
			}else {
				result = 300; //현재 비밀번호가 맞지 않음
			}
		} catch (Exception e) {
			LOG.warn(e.getMessage(), e);
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultCode", result);

		return resultMap;
	}
}

package com.cbdc.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbdc.admin.common.MenuAuthCheck;
import com.cbdc.admin.common.PagingUtil;
import com.cbdc.admin.service.SmartContService;
import com.cbdc.admin.service.SystemService;

@Controller
public class SmartContController {

	private static final Logger LOG = LoggerFactory.getLogger(SmartContController.class);

	@Autowired
	SmartContService smartContService;
	
	//스마트계약관리(목록) 페이지 이동
	@RequestMapping(value ="/smartCont/smartContMngPage.do")
	public String userMngPage(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String returnJsp = "smartCont/smartContMngPage";
		
		return returnJsp;

	}
	
	//계약 등록 페이지 이동
	@RequestMapping(value ="/smartCont/smartContReg.do")
	public String smartContReg(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String returnJsp = "smartCont/smartContReg";
		
		return returnJsp;
	}	
		
	
	/**
	 * 상세페이지 이동 > 상세페이지, 수정페이지, 승인/반려
	 * @param paramMap
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/smartCont/smartContDetail.do")
	public String smartContDetail(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response,Model model) throws Exception {
		String returnJsp = "";
		
		System.out.println("DETAIL CONTROLLER PARAM : " + paramMap);
		
		HttpSession session = request.getSession();
		HashMap<String, Object> userInfoMap = (HashMap<String, Object>) session.getAttribute("USER_INFO");
		paramMap.put("logUserId", userInfoMap.get("USER_ID"));
		
		if(paramMap.get("type").equals("R")) { //read
			returnJsp = "smartCont/smartContDetailPage";
		}else if(paramMap.get("type").equals("U")) { //update
			returnJsp = "smartCont/smartContDetailUpdatePage";
		}else if(paramMap.get("type").equals("CC")) { //checkcode 
			//코드점검 > 승인,반려Page
			returnJsp = "smartCont/smartContDeployPage";
		}
		
		Map<String,Object> detailInfo = smartContService.selectContInfo(paramMap);
		model.addAttribute("selectDetail", detailInfo);
		
		return returnJsp;
	}
	
	
	/**
	 * 스마트 계약관리 > SmartCont List
	 * @param paramMap
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/smartCont/smartContList.json" , method=RequestMethod.POST)
	public Map<String,Object> smartContList(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		
		Map<String,Object> returnMap = new HashMap<>();
		
		int perPage = Integer.parseInt(String.valueOf(paramMap.get("perPage")));
		int currentPage = Integer.parseInt(String.valueOf(paramMap.get("currentPage")));
		
		int paginCnt = 0;
		if (currentPage> 1) {
			paginCnt = (perPage * currentPage) - perPage;
		}
		
		paramMap.put("perPage", Integer.parseInt(String.valueOf(perPage)));
		paramMap.put("currentPage", Integer.parseInt(String.valueOf(paginCnt)));
		
		System.out.println("CONTROLLER PARAM : " + paramMap);
		
		List<HashMap<String, Object>> smartContList = null;
		smartContList = smartContService.smartContList(paramMap);
		int totCnt = smartContService.smartContListCnt(paramMap);
		
		PagingUtil pagingUtil = new PagingUtil(10,perPage,Long.valueOf(totCnt));
		
		returnMap.put("list", smartContList);
		returnMap.put("totCnt", totCnt);
		returnMap.put("paginCnt", totCnt-(currentPage-1)*paginCnt); //목록 글번호 (seq X)
		returnMap.put("paging", pagingUtil.getFixedBlock(currentPage));
		
		return returnMap;
	}

	
	/**
	 * 스마트 계약관리 > 등록/수정/삭제
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/smartCont/smartContInfo.json", method=RequestMethod.POST)
	public Map<String,Object> smartContInfo(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		Map<String,Object> resultMap = new HashMap<>();
		
		HttpSession session = request.getSession();
		HashMap<String, Object> userInfoMap = (HashMap<String, Object>) session.getAttribute("USER_INFO");
		paramMap.put("logUserId", userInfoMap.get("USER_ID"));
		
		int returnInt = 0;
		
		if(paramMap.get("saveType").equals("U")) { //update
			returnInt = smartContService.updateCont(paramMap);
		}else if(paramMap.get("saveType").equals("C")) { //create
			returnInt = smartContService.smartContReg(paramMap);
		}else if(paramMap.get("saveType").equals("D")) { //delete
			returnInt = smartContService.deleteCont(paramMap);
		}else if(paramMap.get("saveType").equals("CC")) {
			//checkcode : 코드점검,승인/반려 상태 업데이트
			returnInt = smartContService.updateStatusCont(paramMap); 
		}
		
		if(returnInt == 1) {
			resultMap.put("resultCode", "200");
		}else {
			resultMap.put("resultCode", "500");
		}
		
		return resultMap;
	}
	
	
}
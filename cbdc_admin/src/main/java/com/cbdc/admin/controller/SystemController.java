package com.cbdc.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbdc.admin.common.PagingUtil;
import com.cbdc.admin.service.SystemService;

@Controller
public class SystemController {

	private static final Logger LOG = LoggerFactory.getLogger(SystemController.class);
	
	@Autowired
	SystemService systemService;
	
	/**
	 * 사용자 관리
	 * @param paramMap
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/systemMng/userMngPage.do"})
    public String userMngPage(@RequestParam HashMap<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		String searchType = "userId";
		String searchWord = "";
		String searchSdate = "";
		String searchEdate = "";
		
		if(paramMap.get("searchType") != null) {
			searchType = paramMap.get("searchType").toString();
	    	searchWord = paramMap.get("searchWord").toString();
		}
		
		if(paramMap.get("searchSdate") != null&&paramMap.get("searchEdate") != null) {
			searchSdate = paramMap.get("searchSdate").toString();
			searchEdate = paramMap.get("searchEdate").toString();
		}
		
		String returnJsp = "";
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchSdate", searchSdate);
		model.addAttribute("searchEdate", searchEdate);
		
		returnJsp = "systemMng/user/userMngPage";
		return returnJsp;
		
    }
	/**
	 * 사용자 목록 ajax 호출
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
    @RequestMapping(value="/systemMng/selectUserList.json", method=RequestMethod.POST)
	public Map<String,Object> selectUserList(@RequestParam HashMap<String,Object> paramMap) throws Exception {
		LOG.debug("paramMap :: " + paramMap.toString());
		
		String searchType = "";
		if(paramMap.get("searchType") != null && !paramMap.get("searchType").equals((""))){
			searchType = paramMap.get("searchType").toString(); 
		}
		
		String searchWord = "";
		if(paramMap.get("searchWord") != null && !paramMap.get("searchWord").equals((""))){
			searchWord = paramMap.get("searchWord").toString(); 
		}
		
		String searchSDate = "";
		if(paramMap.get("searchSDate") != null && !paramMap.get("searchSDate").equals((""))){
			searchSDate = paramMap.get("searchSDate").toString(); 
		}
		
		String searchEDate = "";
		if(paramMap.get("searchEDate") != null && !paramMap.get("searchEDate").equals((""))){
			searchEDate = paramMap.get("searchEDate").toString(); 
		}
		
		int viewPageCnt = Integer.parseInt(String.valueOf(paramMap.get("viewPageCnt")));
    	int currentPageCnt = Integer.parseInt(String.valueOf(paramMap.get("currentPageNum")));
    	int totalCnt =0;
    	int paginCnt = 0;

    	if(currentPageCnt > 1) {
    		paginCnt =( viewPageCnt * currentPageCnt ) - viewPageCnt;
    	}

    	paramMap.put("viewPageCnt", Integer.parseInt(String.valueOf(viewPageCnt)));
    	paramMap.put("paginCnt", Integer.parseInt(String.valueOf(paginCnt)));
    	
    	List<HashMap<String,Object>> userList = null;
    	
    	try {
    		userList = systemService.selectUserList(paramMap);
        	totalCnt = systemService.selectUserTotalCount(paramMap);	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	
    	
    	PagingUtil paging = new PagingUtil(10, viewPageCnt, Long.valueOf(String.valueOf(totalCnt)));
    	
    	Map<String,Object> resultMap = new HashMap<String,Object>();
    	resultMap.put("userList", userList);
    	resultMap.put("totalCnt", totalCnt);
    	resultMap.put("searchType", searchType);
    	resultMap.put("searchWord", searchWord);
    	resultMap.put("searchSDate", searchSDate);
    	resultMap.put("searchEDate", searchEDate);
    	resultMap.put("pagingView", paging.getFixedBlock(currentPageCnt));

    	return resultMap;
	}
	
	@RequestMapping(value="/systemMng/userInputPage.do")
    public String userInputPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
        return "systemMng/user/userInputPage";
    }
}

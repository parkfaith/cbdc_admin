package com.cbdc.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbdc.admin.common.MenuAuthCheck;
import com.cbdc.admin.common.PagingUtil;
import com.cbdc.admin.service.NodeService;

@Controller
public class NodeController {

	private static final Logger LOG = LoggerFactory.getLogger(NodeController.class);
	
	@Autowired
	NodeService nodeService;
	
	@RequestMapping(value = { "/nodeMng/nodeMngPage.do" })
	public String nodeMngPage(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		String searchType = "SEARCHNM";
		String searchWord = "";
		String searchOrg = "";
		String searchNodeType = "";

		if (paramMap.get("searchType") != null) {
			searchType = paramMap.get("searchType").toString();
			searchWord = paramMap.get("searchWord").toString();
		}
		
		if (paramMap.get("searchOrg") != null) {
			searchOrg = paramMap.get("searchOrg").toString();
		}

		if (paramMap.get("searchNodeType") != null) {
			searchNodeType = paramMap.get("searchNodeType").toString();
		}

		String returnJsp = "";

		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchOrg", searchOrg);
		model.addAttribute("searchNodeType", searchNodeType);
		
		/**
		 * 버튼 활성여부 체크
		*/ 
		HttpSession session = request.getSession();
		HashMap<String, Object> userInfoMap = (HashMap<String, Object>) session.getAttribute("USER_INFO");
		HashMap<String, Object> menuInfoMap = (HashMap<String, Object>) session.getAttribute("MENU_AUTHINFO");

		String userAuth = userInfoMap.get("AUTH_CODE").toString();
		String menuAuth = menuInfoMap.get("MENU_AUTH").toString();

		String btnCheck = MenuAuthCheck.authResult(userAuth, menuAuth);
		
		model.addAttribute("btnCheck", btnCheck);
		/**********************************************************************/
		
		returnJsp = "nodeMng/nodeMngPage";
		return returnJsp;

	}
	
	@ResponseBody
	@RequestMapping(value = "/nodeMng/selectNodeList.json", method = RequestMethod.POST)
	public Map<String, Object> selectUserList(@RequestParam HashMap<String, Object> paramMap) throws Exception {
		LOG.debug("paramMap :: " + paramMap.toString());

		String searchType = "";
		if (paramMap.get("searchType") != null && !paramMap.get("searchType").equals((""))) {
			searchType = paramMap.get("searchType").toString();
		}

		String searchWord = "";
		if (paramMap.get("searchWord") != null && !paramMap.get("searchWord").equals((""))) {
			searchWord = paramMap.get("searchWord").toString();
		}

		String searchOrg = "";
		if (paramMap.get("searchOrg") != null && !paramMap.get("searchOrg").equals((""))) {
			searchOrg = paramMap.get("searchOrg").toString();
		}

		String searchNodeType = "";
		if (paramMap.get("searchNodeType") != null && !paramMap.get("searchNodeType").equals((""))) {
			searchNodeType = paramMap.get("searchNodeType").toString();
		}

		int viewPageCnt = Integer.parseInt(String.valueOf(paramMap.get("viewPageCnt")));
		int currentPageCnt = Integer.parseInt(String.valueOf(paramMap.get("currentPageNum")));
		int totalCnt = 0;
		int paginCnt = 0;

		if (currentPageCnt > 1) {
			paginCnt = (viewPageCnt * currentPageCnt) - viewPageCnt;
		}

		paramMap.put("viewPageCnt", Integer.parseInt(String.valueOf(viewPageCnt)));
		paramMap.put("paginCnt", Integer.parseInt(String.valueOf(paginCnt)));

		List<HashMap<String, Object>> nodeList = null;

		try {
			nodeList = nodeService.selectNodeList(paramMap);
			totalCnt = nodeService.selectNodeTotalCount(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			LOG.warn(e.getMessage(), e);
		}

		PagingUtil paging = new PagingUtil(10, viewPageCnt, Long.valueOf(String.valueOf(totalCnt)));

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("nodeList", nodeList);
		resultMap.put("totalCnt", totalCnt);
		resultMap.put("searchType", searchType);
		resultMap.put("searchWord", searchWord);
		resultMap.put("searchOrg", searchOrg);
		resultMap.put("searchNodeType", searchNodeType);
		resultMap.put("pagingView", paging.getFixedBlock(currentPageCnt));

		return resultMap;
	}
	/**
	 * 노드 추가 입력 폼
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/nodeMng/nodeInputPage.do")
	public String nodeInputPage(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		return "nodeMng/nodeInputPage";
	}
	/**
	 * 노드 등록/수정/삭제
	 * @param param
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/nodeMng/cudNodeInfoAjax.json")
	public Map<String, Object> cudNodeInfoAjax(@RequestParam HashMap<String, Object> param, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String resultCode = "";

		HttpSession session = request.getSession();
		HashMap<String, Object> userInfoMap = (HashMap<String, Object>) session.getAttribute("USER_INFO");
		param.put("logUserId", userInfoMap.get("USER_ID"));

		try {
			nodeService.cudNodeInfo(param);
			resultCode = "200";
		} catch (Exception e) {
			// TODO: handle exception
			LOG.warn(e.getMessage(), e);
			resultCode = "500";
		}

		LOG.debug("resultCode :: " + resultCode);
		resultMap.put("resultCode", resultCode);
		return resultMap;
	}
	/**
	 * 노드 상세화면 보기
	 * @param paramMap
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/nodeMng/nodeDetailPage.do" })
	public String nodeDetailPage(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {
		String returnJsp = "";

		HashMap<String, Object> detailMap = new HashMap<>();
		detailMap = nodeService.selectNodeInfo(paramMap);

		model.addAttribute("detailMap", detailMap);
		model.addAttribute("paramMap", paramMap);
		if (paramMap.get("detailType") == null || "".equals(paramMap.get("detailType").toString())) {
			returnJsp = "nodeMng/nodeDetailPage";
		} else {
			returnJsp = "nodeMng/nodeDetailUpdatePage";
		}

		return returnJsp;
	}
}

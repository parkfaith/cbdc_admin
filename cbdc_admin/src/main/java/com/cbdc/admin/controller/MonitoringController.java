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

import com.cbdc.admin.service.MonitoringService;

@Controller
public class MonitoringController {
	
	@Autowired
	MonitoringService monitoringService;

	private static final Logger LOG = LoggerFactory.getLogger(MonitoringController.class);
	/**
	 * 모니터링 > 노드정보
	 * @param paramMap
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/monitoring/nodeInfoPage.do"})
    public String nodeInfoPage(@RequestParam HashMap<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		int test111 = monitoringService.selectTestFirst(paramMap);
		System.out.println("test11111111================"+test111);
		String returnJsp = "monitoring/nodeInfoPage";
		return returnJsp;
	}
	
	@ResponseBody
	@RequestMapping(value = "/monitoring/selectNodeList.json", method = RequestMethod.POST)
	public Map<String, Object> selectNodeList(@RequestParam HashMap<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<HashMap<String,Object>> nodeList = null;
		try {
			nodeList = monitoringService.selectNodeList(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			LOG.warn(e.getMessage(), e);
		}
		
		resultMap.put("nodeList", nodeList);
		
		return resultMap;
	}
	
	@RequestMapping(value={"/monitoring/nodeDetailPage.do"})
	public String nodeDetailPage(@RequestParam HashMap<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		String returnJsp = "";
		
		HashMap<String, Object> detailMap = new HashMap<>();
		//detailMap = systemService.selectAuthInfo(paramMap);
		//model.addAttribute("detailMap", detailMap);
		model.addAttribute("nodeId", paramMap.get("nodeId"));
		
		returnJsp = "monitoring/nodeDetailPage";
		
		return returnJsp;
	}
	/**
	 * 모니터링 > 블록정보
	 * @param paramMap
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/monitoring/blockInfoPage.do"})
    public String blockInfoPage(@RequestParam HashMap<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String returnJsp = "monitoring/blockInfoPage";
		return returnJsp;
	}
	
	@ResponseBody
	@RequestMapping(value = "/monitoring/selectBlockList.json", method = RequestMethod.POST)
	public Map<String, Object> selectBlockList(@RequestParam HashMap<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<HashMap<String,Object>> blockList = null;
		try {
			blockList = monitoringService.selectBlockList(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			LOG.warn(e.getMessage(), e);
		}
		
		resultMap.put("blockList", blockList);
		
		return resultMap;
	}
	
	@RequestMapping(value={"/monitoring/blockDetailPage.do"})
	public String blockDetailPage(@RequestParam HashMap<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		String returnJsp = "";
		
		HashMap<String, Object> detailMap = new HashMap<>();
		//detailMap = systemService.selectAuthInfo(paramMap);
		//model.addAttribute("detailMap", detailMap);
		model.addAttribute("blockId", paramMap.get("blockId"));
		
		returnJsp = "monitoring/blockDetailPage";
		
		return returnJsp;
	}
	
	@ResponseBody
	@RequestMapping(value = "/monitoring/selectBlockInfo.json", method = RequestMethod.POST)
	public Map<String, Object> selectBlockInfo(@RequestParam HashMap<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> blockInfoMap = new HashMap<String, Object>();
		try {
			blockInfoMap = monitoringService.selectBlockInfo(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			LOG.warn(e.getMessage(), e);
		}
		
		resultMap.put("blockInfoMap", blockInfoMap);
		
		return resultMap;
	}
	/**
	 * 모니터링 / 거래정보
	 * @param paramMap
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/monitoring/txInfoPage.do"})
    public String txInfoPage(@RequestParam HashMap<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		int test = monitoringService.selectTestSecond(paramMap);
		System.out.println("test22222222================"+test);
		String returnJsp = "monitoring/txInfoPage";
		return returnJsp;
	}
}

package com.cbdc.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MonitoringController {

	private static final Logger LOG = LoggerFactory.getLogger(MonitoringController.class);
	/**
	 * 모니터링 / 노드정보
	 * @param paramMap
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/monitoring/nodeInfoPage.do"})
    public String nodeInfoPage(@RequestParam HashMap<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		String returnJsp = "monitoring/nodeInfoPage";
		return returnJsp;
	}
	/**
	 * 모니터링/블록정보
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
		
		String returnJsp = "monitoring/txInfoPage";
		return returnJsp;
	}
}

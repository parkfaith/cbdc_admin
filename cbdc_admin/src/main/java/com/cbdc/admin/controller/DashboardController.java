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
public class DashboardController {

	private static final Logger LOG = LoggerFactory.getLogger(DashboardController.class);
	
	@RequestMapping(value={"/dashboardPage.do"})
    public String dashboardPage(@RequestParam HashMap<String,Object> paramMap, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String returnJsp = "dashboard/dashboardPage";
		return returnJsp;
	}
}

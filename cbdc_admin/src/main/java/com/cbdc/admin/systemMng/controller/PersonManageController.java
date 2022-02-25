package com.cbdc.admin.systemMng.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbdc.admin.systemMng.model.PersonManageModel;
import com.cbdc.admin.systemMng.service.PersonManageService;

@Controller
public class PersonManageController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PersonManageService personManageService;
	/**
	 * 시스템 관리 > 사용자 관리 > 목록
	 * @return
	 */
	@RequestMapping("/systemMng/personManage.do")
    public String personManageList() {
        return "systemMng/person/personManage";
    }
	/**
	 * 사용자 목록 ajax
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/systemMng/personManageListAjax.do")
    @ResponseBody
    public HashMap<String, Object> personManageListAjax(PersonManageModel pmm) throws Exception{
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		List<PersonManageModel> personList = personManageService.getPersonList(pmm);
		result.put("personList", personList);
		
        return result;
    }

}

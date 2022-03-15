package com.cbdc.admin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.cbdc.admin.common.PropertyUtil;
import com.cbdc.admin.service.MonitoringService;

@Service
public class MonitoringServiceImpl implements MonitoringService{

	public List<HashMap<String, Object>> selectNodeList(HashMap<String, Object> paramMap) {
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
		String url = PropertyUtil.getProperty("Global.Klaytn.Url");
		
		return resultList;
	}
}

package com.cbdc.admin.service;

import java.util.HashMap;
import java.util.List;

public interface MonitoringService {

	public List<HashMap<String, Object>> selectNodeList(HashMap<String, Object> paramMap);
	
	public List<HashMap<String, Object>> selectBlockList(HashMap<String, Object> paramMap);
	public HashMap<String, Object> selectBlockInfo(HashMap<String, Object> paramMap);
	
}

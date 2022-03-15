package com.cbdc.admin.service;

import java.util.HashMap;
import java.util.List;

public interface MonitoringService {

	public List<HashMap<String, Object>> selectNodeList(HashMap<String, Object> paramMap);
}

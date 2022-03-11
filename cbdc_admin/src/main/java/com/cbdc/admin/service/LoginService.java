package com.cbdc.admin.service;

import java.util.HashMap;

public interface LoginService {

	public HashMap<String, Object> selectLoginInfo(HashMap<String, Object> paramMap);
	public int insertLoginLog(HashMap<String, Object> paramMap);
}

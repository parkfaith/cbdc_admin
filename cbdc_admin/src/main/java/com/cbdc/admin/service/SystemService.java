package com.cbdc.admin.service;

import java.util.HashMap;
import java.util.List;

public interface SystemService {
	/**
	 * 사용자 목록조회
	 * @param paramMap
	 * @return
	 */
	public List<HashMap<String, Object>> selectUserList(HashMap<String, Object> paramMap);
	public int selectUserTotalCount(HashMap<String, Object> paramMap);
}

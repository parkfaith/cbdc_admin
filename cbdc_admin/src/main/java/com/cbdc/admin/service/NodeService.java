package com.cbdc.admin.service;

import java.util.HashMap;
import java.util.List;

public interface NodeService {
	/**
	 * 노드 관리 목록 조회
	 * @param paramMap
	 * @return
	 */
	public List<HashMap<String, Object>> selectNodeList(HashMap<String, Object> paramMap);
	public int selectNodeTotalCount(HashMap<String, Object> paramMap);
	/**
	 * 노드 등록,수정,삭제
	 * @param paramMap
	 * @return
	 */
	public int cudNodeInfo(HashMap<String, Object> paramMap);
	/**
	 * 노드 상세페이지
	 * @param paramMap
	 * @return
	 */
	public HashMap<String, Object> selectNodeInfo(HashMap<String, Object> paramMap);
}

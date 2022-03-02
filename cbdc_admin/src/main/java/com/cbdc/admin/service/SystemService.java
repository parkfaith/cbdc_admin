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
	/**
	 * 사용자 등록, 수정, 삭제(사용자 아이디 체크)
	 * @param paramMap
	 * @return
	 */
	public int cudUserInfo(HashMap<String, Object> paramMap);
	public int checkUserId(HashMap<String, Object> paramMap);
	public int selectUserSeq(HashMap<String, Object> paramMap);
	/**
	 * 사용자 상세 페이지
	 * @param paramMap
	 * @return
	 */
	public HashMap<String, Object> selectUserInfo(HashMap<String, Object> paramMap);
	/**
	 * 권한 목록조회
	 * @param paramMap
	 * @return
	 */
	public List<HashMap<String, Object>> selectAuthList(HashMap<String, Object> paramMap);
	public int selectAuthTotalCount(HashMap<String, Object> paramMap);
	/**
	 * 권한 등록, 수정, 삭제
	 * @param paramMap
	 * @return
	 */
	public int cudAuthInfo(HashMap<String, Object> paramMap);
	public int selectAuthSeq(HashMap<String, Object> paramMap);
	/**
	 * 권한 상세 페이지
	 * @param paramMap
	 * @return
	 */
	public HashMap<String, Object> selectAuthInfo(HashMap<String, Object> paramMap);
}

package com.cbdc.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SystemDAO {
	/************ 사용자 관리 ***********************************/
	public List<HashMap<String, Object>> selectUserList(HashMap<String, Object> paramMap);
	public int selectUserTotalCount(HashMap<String, Object> paramMap);
	
	public int insertUserInfo(HashMap<String, Object> paramMap);
	public int selectUserSeq(HashMap<String, Object> paramMap);
	public int checkUserId(HashMap<String, Object> paramMap);
	
	public HashMap<String, Object> selectUserInfo(HashMap<String, Object> paramMap);
	
	public int deleteUserInfo(HashMap<String, Object> paramMap);
	public int updateUserInfo(HashMap<String, Object> paramMap);

	/************ 권한 관리 ***********************************/
	public List<HashMap<String, Object>> selectAuthList(HashMap<String, Object> paramMap);
	public int selectAuthTotalCount(HashMap<String, Object> paramMap);
	
	public int insertAuthInfo(HashMap<String, Object> paramMap);
	public int selectAuthSeq(HashMap<String, Object> paramMap);

	public HashMap<String, Object> selectAuthInfo(HashMap<String, Object> paramMap);
	
	public int deleteAuthInfo(HashMap<String, Object> paramMap);
	public int updateAuthInfo(HashMap<String, Object> paramMap);
}

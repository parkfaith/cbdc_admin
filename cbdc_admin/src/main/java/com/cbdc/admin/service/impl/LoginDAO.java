package com.cbdc.admin.service.impl;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	public HashMap<String, Object> selectLoginInfo(HashMap<String, Object> paramMap);
	public int insertLoginLog(HashMap<String, Object> paramMap);
	public int updateLastAccessInfo(HashMap<String, Object> paramMap);
	public int updatePassword(HashMap<String, Object> paramMap);
	
	public HashMap<String, Object> selectMenuInfo(HashMap<String, Object> paramMap);
}

package com.cbdc.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SystemDAO {
	
	public List<HashMap<String, Object>> selectUserList(HashMap<String, Object> paramMap);
	public int selectUserTotalCount(HashMap<String, Object> paramMap);
	
	public int insertUserInfo(HashMap<String, Object> paramMap);
	public int selectUserSeq(HashMap<String, Object> paramMap);
	public int checkUserId(HashMap<String, Object> paramMap);
	
	public HashMap<String, Object> selectUserInfo(HashMap<String, Object> paramMap);
	
	public int deleteUserInfo(HashMap<String, Object> paramMap);

}

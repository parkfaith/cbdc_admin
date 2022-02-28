package com.cbdc.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SystemDAO {
	
	public List<HashMap<String, Object>> selectUserList(HashMap<String, Object> paramMap);
	public int selectUserTotalCount(HashMap<String, Object> paramMap);

}

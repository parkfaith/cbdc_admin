package com.cbdc.admin.service.impl;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MonitorDAO {
	public int selectTestFirst(HashMap<String, Object> paramMap);
}

package com.cbdc.admin.mapper.master;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MonitorMapper {
	public int selectTestFirst(HashMap<String, Object> paramMap);
}

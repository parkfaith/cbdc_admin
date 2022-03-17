package com.cbdc.admin.mapper.second;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MonitorTxMapper {
	public int selectTestSecond(HashMap<String, Object> paramMap);
}

package com.cbdc.admin.service.impl.monDao2;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MonitorTxDAO {
	public int selectTestSecond(HashMap<String, Object> paramMap);
}

package com.cbdc.admin.mapper.master;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NodeMapper {

	public List<HashMap<String, Object>> selectNodeList(HashMap<String, Object> paramMap);
	public int selectNodeTotalCount(HashMap<String, Object> paramMap);
	
	public int insertNodeInfo(HashMap<String, Object> paramMap);
	
	public HashMap<String, Object> selectNodeInfo(HashMap<String, Object> paramMap);
	
	public int deleteNodeInfo(HashMap<String, Object> paramMap);
	public int updateNodeInfo(HashMap<String, Object> paramMap);
}

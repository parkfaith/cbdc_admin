package com.cbdc.admin.mapper.master;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SmartContMapper {
	/************ Smart Contract ***********************************/
	public List<HashMap<String, Object>> smartContList(HashMap<String, Object> paramMap);
	public int smartContListCnt(HashMap<String, Object> paramMap);
	public int smartContReg(HashMap<String, Object> paramMap);
	public int deleteCont(HashMap<String, Object> paramMap);
	public int updateCont(HashMap<String, Object> paramMap);
	public Map<String, Object> selectContInfo(HashMap<String, Object> paramMap);
	public int updateStatusCont(HashMap<String, Object> paramMap);
}

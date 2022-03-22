package com.cbdc.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.cbdc.admin.mapper.master.SmartContMapper;
import com.cbdc.admin.service.SmartContService;

@Service
public class SmartContServiceImpl implements SmartContService{

	@Autowired
	private SmartContMapper smartContMapper;
	
	@Autowired 
	private PasswordEncoder passwordEncoder;
	 
	
	@Override
	public List<HashMap<String, Object>> smartContList(HashMap<String, Object> paramMap){
		return smartContMapper.smartContList(paramMap);
	}

	@Override
	public int smartContListCnt(HashMap<String, Object> paramMap) {
		return smartContMapper.smartContListCnt(paramMap);
	}

	@Override
	public int smartContReg(HashMap<String, Object> paramMap) {
		return smartContMapper.smartContReg(paramMap);
	}

	@Override
	public int deleteCont(HashMap<String, Object> paramMap) {
		return smartContMapper.deleteCont(paramMap);
	}

	@Override
	public int updateCont(HashMap<String, Object> paramMap) {
		return smartContMapper.updateCont(paramMap);
	}

	@Override
	public Map<String, Object> selectContInfo(HashMap<String, Object> paramMap) {
		return smartContMapper.selectContInfo(paramMap);
	}

	@Override
	public int updateStatusCont(HashMap<String, Object> paramMap) {
		return smartContMapper.updateStatusCont(paramMap);
	}
	
	
	
}

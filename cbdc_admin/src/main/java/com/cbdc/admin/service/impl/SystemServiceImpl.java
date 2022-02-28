package com.cbdc.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbdc.admin.service.SystemService;

@Service
public class SystemServiceImpl implements SystemService{

	@Autowired
	private SystemDAO systemDAO;
	
	@Override
	public List<HashMap<String, Object>> selectUserList(HashMap<String, Object> paramMap){
		return systemDAO.selectUserList(paramMap);
	}
	
	@Override
	public int selectUserTotalCount(HashMap<String, Object> paramMap) {
		return systemDAO.selectUserTotalCount(paramMap);
	}
}

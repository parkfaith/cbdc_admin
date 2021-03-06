package com.cbdc.admin.service.impl;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbdc.admin.mapper.master.LoginMapper;
import com.cbdc.admin.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{
	
	private static final Logger LOG = LoggerFactory.getLogger(LoginServiceImpl.class);

	@Autowired
	private LoginMapper loginMapper;
	
	@Override
	public HashMap<String, Object> selectLoginInfo(HashMap<String, Object> paramMap) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			resultMap =loginMapper.selectLoginInfo(paramMap);
		} catch (Exception e) {
			LOG.warn(e.getMessage(), e);
		}

		return resultMap;
	}
	
	@Override
	public int insertLoginLog(HashMap<String, Object> paramMap) {
		return loginMapper.insertLoginLog(paramMap);
	}
	
	@Override
	public int updateLastAccessInfo(HashMap<String, Object> paramMap) {
		return loginMapper.updateLastAccessInfo(paramMap);
	}
	
	@Override
	public HashMap<String, Object> selectMenuInfo(HashMap<String, Object> paramMap) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			resultMap =loginMapper.selectMenuInfo(paramMap);
		} catch (Exception e) {
			LOG.warn(e.getMessage(), e);
		}

		return resultMap;
	}
	
	@Override
	public int updatePassword(HashMap<String, Object> paramMap) {
		return loginMapper.updatePassword(paramMap);
	}
}

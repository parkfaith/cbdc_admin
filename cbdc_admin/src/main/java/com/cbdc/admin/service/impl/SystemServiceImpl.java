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
	
	@Override
	public int checkUserId(HashMap<String, Object> paramMap) {
		return systemDAO.checkUserId(paramMap);
	}
	
	@Override
	public int selectUserSeq(HashMap<String, Object> paramMap) {
		return systemDAO.selectUserSeq(paramMap);
	}
	
	@Override
	public int cudUserInfo(HashMap<String, Object> paramMap) {
		String saveType = (String) paramMap.get("saveType");
		int  returnInt = 0;
		
		if("C".equals(saveType)) {//입력일 때
			paramMap.put("userPwd","12345");
			paramMap.put("authCode","");
			paramMap.put("logUserLid","admin");
			
			returnInt = systemDAO.insertUserInfo(paramMap);
		}else if("U".equals(saveType)) {//수정일 때
			
		}else if("D".equals(saveType)) {//삭제 일 때
			returnInt = systemDAO.deleteUserInfo(paramMap);
		}else {
			returnInt = 500;
		}
		
		return returnInt;
	}
	
	@Override
	public HashMap<String, Object> selectUserInfo(HashMap<String, Object> paramMap) {
		return systemDAO.selectUserInfo(paramMap);
	}
}

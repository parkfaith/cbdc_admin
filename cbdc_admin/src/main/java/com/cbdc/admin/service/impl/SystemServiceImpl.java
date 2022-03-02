package com.cbdc.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

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
			paramMap.put("logUserId","admin");
			
			returnInt = systemDAO.insertUserInfo(paramMap);
		}else if("U".equals(saveType)) {//수정일 때
			paramMap.put("logUserId","admin");
			returnInt = systemDAO.updateUserInfo(paramMap);
		}else if("D".equals(saveType)) {//삭제 일 때
			paramMap.put("logUserId","admin");
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
	
	@Override
	public List<HashMap<String, Object>> selectAuthList(HashMap<String, Object> paramMap){
		return systemDAO.selectAuthList(paramMap);
	}
	
	@Override
	public int selectAuthTotalCount(HashMap<String, Object> paramMap) {
		return systemDAO.selectAuthTotalCount(paramMap);
	}
	
	@Override
	public int selectAuthSeq(HashMap<String, Object> paramMap) {
		return systemDAO.selectAuthSeq(paramMap);
	}
	
	@Override
	public int cudAuthInfo(HashMap<String, Object> paramMap) {
		String saveType = (String) paramMap.get("saveType");
		int  returnInt = 0;
		
		if("C".equals(saveType)) {//입력일 때
			//권한 코드 - 20자리 영어대소문자 + 숫자
			int leftLimit = 48; // numeral '0'
		    int rightLimit = 122; // letter 'z'
		    int targetStringLength = 20;
		    Random random = new Random();
		    String generatedString = random.ints(leftLimit, rightLimit + 1)
                    .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
                    .limit(targetStringLength)
                    .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                    .toString();
		    paramMap.put("authCode", generatedString);
		    paramMap.put("logUserId","admin");
		    
			returnInt = systemDAO.insertAuthInfo(paramMap);
		}else if("U".equals(saveType)) {//수정일 때
			paramMap.put("logUserId","admin");
			returnInt = systemDAO.updateAuthInfo(paramMap);
		}else if("D".equals(saveType)) {//삭제 일 때
			paramMap.put("logUserId","admin");
			returnInt = systemDAO.deleteAuthInfo(paramMap);
		}else {
			returnInt = 500;
		}
		
		return returnInt;
	}
	
	@Override
	public HashMap<String, Object> selectAuthInfo(HashMap<String, Object> paramMap) {
		return systemDAO.selectAuthInfo(paramMap);
	}
}

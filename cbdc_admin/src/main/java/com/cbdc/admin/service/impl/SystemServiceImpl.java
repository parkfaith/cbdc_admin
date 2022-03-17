package com.cbdc.admin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.cbdc.admin.service.SystemService;

@Service
public class SystemServiceImpl implements SystemService{

	@Autowired
	private SystemDAO systemDAO;
	
	@Autowired 
	private PasswordEncoder passwordEncoder;
	 
	
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
			String passInit = paramMap.get("userId").toString();
			String encPass = passwordEncoder.encode(passInit);
			 
			paramMap.put("userPwd",encPass);// 초기에는 userid 와 동일
			paramMap.put("authCode","");
			
			returnInt = systemDAO.insertUserInfo(paramMap);
		}else if("U".equals(saveType)) {//수정일 때
			returnInt = systemDAO.updateUserInfo(paramMap);
		}else if("D".equals(saveType)) {//삭제 일 때
			returnInt = systemDAO.deleteUserInfo(paramMap);
		}else {
			returnInt = 500;
		}
		
		return returnInt;
	}
	
	@Override
	public HashMap<String, Object> selectUserInfo(HashMap<String, Object> paramMap) {
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, Object> userInfoMap = systemDAO.selectUserInfo(paramMap);
		/*
		List<HashMap<String, Object>> authNameList = new ArrayList<HashMap<String, Object>>();
		//권한 이름
		if(userInfoMap.get("AUTH_CODE")==null||"".equals(userInfoMap.get("AUTH_CODE"))) {
			
		}else {
			String authCode = userInfoMap.get("AUTH_CODE").toString();
			String[] authCodeArr = authCode.split(",");
			
			for(int i=0; i<authCodeArr.length; i++) {
				if(authCodeArr[i]==null||"".equals(authCodeArr[i])) {
					
				}else {
					HashMap<String, Object> authInfo = systemDAO.selectAuthInfoFromCode(paramMap);
					authInfo.put("authCode", authInfo.get("AUTH_CODE"));
					authInfo.put("authName", authInfo.get("AUTH_NM"));
					authNameList.add(authInfo);
				}
			}
		}
		*/
		returnMap.put("userInfoMap", userInfoMap);
		//returnMap.put("authNameList", authNameList);
		//return systemDAO.selectUserInfo(paramMap);
		return returnMap;
	}
	
	@Override
	public List<HashMap<String, Object>> selectAuthNameList(HashMap<String, Object> paramMap){
		List<HashMap<String, Object>> authNameList = new ArrayList<HashMap<String, Object>>();
		if(paramMap.get("authCodeStr")==null||"".equals(paramMap.get("authCodeStr"))) {
			authNameList = null;
		}else {
			String authCode = paramMap.get("authCodeStr").toString();
			String[] authCodeArr = authCode.split(",");
			
			for(int i=0; i<authCodeArr.length; i++) {
				if(authCodeArr[i]==null||"".equals(authCodeArr[i])) {
					
				}else {
					paramMap.put("authCode", authCodeArr[i]);
					HashMap<String, Object> authInfo = systemDAO.selectAuthInfoFromCode(paramMap);
					authInfo.put("authCode", authInfo.get("AUTH_CODE"));
					authInfo.put("authName", authInfo.get("AUTH_NM"));
					authNameList.add(authInfo);
				}
			}
		}
		return authNameList;
	}
	
	@Override
	public List<HashMap<String, Object>> selectAuthList(HashMap<String, Object> paramMap){
		return systemDAO.selectAuthList(paramMap);
	}
	
	@Override
	public List<HashMap<String, Object>> selectAuthListNoPaging(HashMap<String, Object> paramMap){
		return systemDAO.selectAuthListNoPaging(paramMap);
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
		    
			returnInt = systemDAO.insertAuthInfo(paramMap);
		}else if("U".equals(saveType)) {//수정일 때
			returnInt = systemDAO.updateAuthInfo(paramMap);
		}else if("D".equals(saveType)) {//삭제 일 때
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
	
	@Override
	public List<HashMap<String, Object>> selectAuthUserList(HashMap<String, Object> paramMap){
		return systemDAO.selectAuthUserList(paramMap);
	}
	
	@Override
	public int selectAuthUserTotalCount(HashMap<String, Object> paramMap) {
		return systemDAO.selectAuthUserTotalCount(paramMap);
	}
	
	@Override
	public int authUserInDel(HashMap<String, Object> paramMap) {
		String saveType = (String) paramMap.get("saveType");
		int  returnInt = 0;
		
		String authUserArrVal = paramMap.get("authUserArr").toString();
		String authUserVal = "";
		if(authUserArrVal.contains(",")) {
			String[] authUserArr = authUserArrVal.split(",");
			
			for(int i=0; i<authUserArr.length; i++) {
				authUserVal = authUserArr[i];
				paramMap.put("authUserVal", authUserVal);
				if("C".equals(saveType)) {//입력일 때
					systemDAO.insertUserAuthInfo(paramMap);
				}else if("D".equals(saveType)) {//입력일 때
					systemDAO.deleteUserAuthInfo(paramMap);
				}else {
					returnInt = 500;
				}
			}
		}else {
			authUserVal = authUserArrVal;
			paramMap.put("authUserVal", authUserVal);
			//insert code
			if("C".equals(saveType)) {//입력일 때
				systemDAO.insertUserAuthInfo(paramMap);
			}else if("D".equals(saveType)) {//입력일 때
				systemDAO.deleteUserAuthInfo(paramMap);
			}else {
				returnInt = 500;
			}
		}
		
		return returnInt;
	}
	
	@Override
	public List<HashMap<String, Object>> selectMenuList(HashMap<String, Object> paramMap){
		return systemDAO.selectMenuList(paramMap);
	}
	
	@Override
	public HashMap<String, Object> selectMenuInfo(HashMap<String, Object> paramMap) {
		return systemDAO.selectMenuInfo(paramMap);
	}
	
	@Override
	public int cudMenuInfo(HashMap<String, Object> paramMap) {
		String saveType = (String) paramMap.get("saveType");
		int  returnInt = 0;
		
		if("C".equals(saveType)) {//입력일 때
			returnInt = systemDAO.insertMenuInfo(paramMap);
		}else if("U".equals(saveType)) {//수정일 때
			
			// **** 메뉴 순서 변경 추가
			String[] seq = ((String) paramMap.get("seq")).split(",");
			String[] order = ((String) paramMap.get("order")).split(",");
			String[] folder = ((String) paramMap.get("folder")).split(",");
			String[] porder = ((String) paramMap.get("porder")).split(",");
			
			List<Map<String,Object>> depth2 = new ArrayList<>();
			List<Map<String,Object>> depth3 = new ArrayList<>();
			
			 for(int i = 0; i < seq.length; i++) { //DEPTH 2 순서 변경
				Map<String,Object> menuListMap = new HashMap<String, Object>();
				menuListMap.put("menuSeq", seq[i]);
				menuListMap.put("menuOrder", order [i]);
				
				depth2.add(menuListMap);
			 }
			 for(int i=0; i<folder.length; i++) { //DEPTH 3 PORDER 변경
				Map<String,Object> pOrderListMap = new HashMap<String, Object>();
				pOrderListMap.put("menuFolder", folder[i]);
				pOrderListMap.put("menuPorder", porder[i]);
				
				depth3.add(pOrderListMap);
			 } 
			 paramMap.put("depth2", depth2);
			 paramMap.put("depth3", depth3);
			 // **** 메뉴 순서 변경 추가 끝
			 
			returnInt = systemDAO.updateMenuInfo(paramMap) 
					+ systemDAO.updateMenuOrder(paramMap) + systemDAO.updateMenuPOrder(paramMap);
		}else if("D".equals(saveType)) {//삭제 일 때
			returnInt = systemDAO.deleteMenuInfo(paramMap);
		}else {
			returnInt = 500;
		}
		
		return returnInt;
	}
	
	@Override
	public List<HashMap<String, Object>> selectUpperMenuList(HashMap<String, Object> paramMap){
		return systemDAO.selectUpperMenuList(paramMap);
	}
	
}

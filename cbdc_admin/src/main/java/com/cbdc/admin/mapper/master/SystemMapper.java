package com.cbdc.admin.mapper.master;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SystemMapper {
	/************ 사용자 관리 ***********************************/
	public List<HashMap<String, Object>> selectUserList(HashMap<String, Object> paramMap);
	public int selectUserTotalCount(HashMap<String, Object> paramMap);
	
	public int insertUserInfo(HashMap<String, Object> paramMap);
	public int selectUserSeq(HashMap<String, Object> paramMap);
	public int checkUserId(HashMap<String, Object> paramMap);
	
	public HashMap<String, Object> selectUserInfo(HashMap<String, Object> paramMap);
	
	public int deleteUserInfo(HashMap<String, Object> paramMap);
	public int updateUserInfo(HashMap<String, Object> paramMap);

	/************ 권한 관리 ***********************************/
	public List<HashMap<String, Object>> selectAuthList(HashMap<String, Object> paramMap);
	public int selectAuthTotalCount(HashMap<String, Object> paramMap);
	
	public int insertAuthInfo(HashMap<String, Object> paramMap);
	public int selectAuthSeq(HashMap<String, Object> paramMap);

	public HashMap<String, Object> selectAuthInfo(HashMap<String, Object> paramMap);
	public HashMap<String, Object> selectAuthInfoFromCode(HashMap<String, Object> paramMap);
	
	public int deleteAuthInfo(HashMap<String, Object> paramMap);
	public int updateAuthInfo(HashMap<String, Object> paramMap);
	
	public List<HashMap<String, Object>> selectAuthUserList(HashMap<String, Object> paramMap);
	public int selectAuthUserTotalCount(HashMap<String, Object> paramMap);
	
	public int insertUserAuthInfo(HashMap<String, Object> paramMap);
	public int deleteUserAuthInfo(HashMap<String, Object> paramMap);
	
	/************ 메뉴 관리 ***********************************/
	public List<HashMap<String, Object>> selectMenuList(HashMap<String, Object> paramMap);
	public List<HashMap<String, Object>> selectAuthListNoPaging(HashMap<String, Object> paramMap);
	public HashMap<String, Object> selectMenuInfo(HashMap<String, Object> paramMap);
	public List<HashMap<String, Object>> selectUpperMenuList(HashMap<String, Object> paramMap);
	
	public int insertMenuInfo(HashMap<String, Object> paramMap);
	public int updateMenuInfo(HashMap<String, Object> paramMap);
	public int deleteMenuInfo(HashMap<String, Object> paramMap);
	public int updateMenuOrder(HashMap<String, Object> paramMap);
	public int updateMenuPOrder(HashMap<String, Object> paramMap);
}

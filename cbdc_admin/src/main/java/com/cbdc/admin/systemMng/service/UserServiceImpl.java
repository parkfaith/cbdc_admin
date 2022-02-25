package com.cbdc.admin.systemMng.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cbdc.admin.systemMng.dao.UserDao;
import com.cbdc.admin.systemMng.model.UserModel;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
	private final UserDao userDao; 
	
	@Override
	public List<UserModel> getCodeList(){
		return userDao.getCodeList();
	}
}

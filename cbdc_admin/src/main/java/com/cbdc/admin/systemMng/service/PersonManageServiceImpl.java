package com.cbdc.admin.systemMng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbdc.admin.systemMng.dao.PersonManageMapper;
import com.cbdc.admin.systemMng.model.PersonManageModel;

@Service
public class PersonManageServiceImpl implements PersonManageService{
	
	@Autowired
	private PersonManageMapper personManageMapper;
	
	@Override
	public List<PersonManageModel> getPersonList() throws Exception {
		return personManageMapper.getPersonList();
	}
}

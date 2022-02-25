package com.cbdc.admin.systemMng.service;

import java.util.List;

import com.cbdc.admin.systemMng.model.PersonManageModel;

public interface PersonManageService {
	public List<PersonManageModel> getPersonList() throws Exception;
}

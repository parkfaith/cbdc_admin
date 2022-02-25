package com.cbdc.admin.systemMng.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cbdc.admin.systemMng.model.PersonManageModel;

@Repository
@Mapper
public interface PersonManageMapper {
	List<PersonManageModel> getPersonList(PersonManageModel pmm);
}

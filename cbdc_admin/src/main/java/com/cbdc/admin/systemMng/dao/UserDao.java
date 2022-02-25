package com.cbdc.admin.systemMng.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cbdc.admin.systemMng.model.UserModel;

@Repository
@Mapper
public interface UserDao {
	List<UserModel> getCodeList();
}

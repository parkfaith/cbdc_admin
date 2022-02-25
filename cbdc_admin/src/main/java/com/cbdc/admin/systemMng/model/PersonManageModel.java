package com.cbdc.admin.systemMng.model;

import lombok.Data;

@Data
public class PersonManageModel {
	private int user_seq;
	private String user_id;
	private String user_pwd;
	private String user_nm;
	private String auth_code;
	private String reg_id;
	private String reg_date;
	private String upd_id;
	private String upd_date;
	//검색 관련
	private String search_type;
	private String search_sDate;
	private String search_eDate;
	private String search_keyword;
}

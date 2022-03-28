package com.cbdc.admin.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.cbdc.admin.mapper.master.SmartContMapper;
import com.cbdc.admin.service.SmartContService;

@Service
public class SmartContServiceImpl implements SmartContService{

	@Autowired
	private SmartContMapper smartContMapper;
	
	@Autowired 
	private PasswordEncoder passwordEncoder;
	 
	
	@Override
	public List<HashMap<String, Object>> smartContList(HashMap<String, Object> paramMap){
		return smartContMapper.smartContList(paramMap);
	}

	@Override
	public int smartContListCnt(HashMap<String, Object> paramMap) {
		return smartContMapper.smartContListCnt(paramMap);
	}

	@Override
	public int smartContReg(HashMap<String, Object> paramMap) {
		return smartContMapper.smartContReg(paramMap);
	}

	@Override
	public int deleteCont(HashMap<String, Object> paramMap) {
		return smartContMapper.deleteCont(paramMap);
	}

	@Override
	public int updateCont(HashMap<String, Object> paramMap) {
		return smartContMapper.updateCont(paramMap);
	}

	@Override
	public Map<String, Object> selectContInfo(HashMap<String, Object> paramMap) {
		return smartContMapper.selectContInfo(paramMap);
	}

	@Override
	public int updateStatusCont(HashMap<String, Object> paramMap) {
		/**
		 * 추가사항 박준형
		 */
		int returnInt = 0;
		Runtime rt = Runtime.getRuntime();
		Process pc = null;
		String codeCheckURL = "";
		try {
			pc = rt.exec(codeCheckURL);
			BufferedReader br = new BufferedReader(new InputStreamReader(pc.getInputStream()));
			String line = null;
			while((line = br.readLine()) != null){
		        System.out.println(line);
		    }
			returnInt = smartContMapper.updateStatusCont(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return returnInt;
		
		/********************************/
		//return smartContMapper.updateStatusCont(paramMap);
	}
	
	
	
}

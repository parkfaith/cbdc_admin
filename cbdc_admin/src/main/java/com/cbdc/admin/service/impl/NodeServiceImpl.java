package com.cbdc.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbdc.admin.mapper.master.NodeMapper;
import com.cbdc.admin.service.NodeService;

@Service
public class NodeServiceImpl implements NodeService{
	@Autowired
	private NodeMapper nodeMapper;
	
	@Override
	public List<HashMap<String, Object>> selectNodeList(HashMap<String, Object> paramMap){
		return nodeMapper.selectNodeList(paramMap);
	}
	
	@Override
	public int selectNodeTotalCount(HashMap<String, Object> paramMap) {
		return nodeMapper.selectNodeTotalCount(paramMap);
	}
	
	@Override
	public int cudNodeInfo(HashMap<String, Object> paramMap) {
		String saveType = (String) paramMap.get("saveType");
		int  returnInt = 0;
		
		if("C".equals(saveType)) {//입력일 때
			returnInt = nodeMapper.insertNodeInfo(paramMap);
		}else if("U".equals(saveType)) {//수정일 때
			returnInt = nodeMapper.updateNodeInfo(paramMap);
		}else if("D".equals(saveType)) {//삭제 일 때
			returnInt = nodeMapper.deleteNodeInfo(paramMap);
		}else {
			returnInt = 500;
		}
		
		return returnInt;
	}
	
	@Override
	public HashMap<String, Object> selectNodeInfo(HashMap<String, Object> paramMap) {
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, Object> nodeInfoMap = nodeMapper.selectNodeInfo(paramMap);
		
		returnMap.put("nodeInfoMap", nodeInfoMap);
		
		return returnMap;
	}

}

package com.cbdc.admin.service.impl;

import java.io.FileReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.cbdc.admin.mapper.master.MonitorMapper;
import com.cbdc.admin.mapper.second.MonitorTxMapper;
import com.cbdc.admin.service.MonitoringService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

@Service
public class MonitoringServiceImpl implements MonitoringService{
	
	private static final Logger LOG = LoggerFactory.getLogger(MonitoringServiceImpl.class);
	
	@Autowired
	private MonitorMapper monitorMapper;
	
	@Autowired
	private MonitorTxMapper monitorTxMapper;

	@Override
	public List<HashMap<String, Object>> selectNodeList(HashMap<String, Object> paramMap) {
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> result = new HashMap<String, Object>();
		String jsonInString = "";
		//String url = PropertyUtil.getProperty("Global.Klaytn.Url");
		
		try {
	        RestTemplate restTemplate = new RestTemplate();
	        
	        HttpHeaders header = new HttpHeaders();
	        HttpEntity<?> entity = new HttpEntity<>(header);
	        
	        String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
	        
	        UriComponents uri = UriComponentsBuilder.fromHttpUrl(url+"?"+"key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101").build();
	        
	        ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
            
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            //JsonNode json = mapper.readTree(resultMap.getBody().toString());
            //ArrayNode entitiesList = (ArrayNode) json.get("result");
            
            JSONParser parser = new JSONParser();
            Reader reader = new FileReader("D:\\admin_peers.json");
            JSONObject jsonObject = (JSONObject) parser.parse(reader);

            JsonNode json = mapper.readTree(jsonObject.toString());
            ArrayNode nodeListArr = (ArrayNode) json.get("result");
            
            if(nodeListArr != null) {
            	for(int i=0; i < nodeListArr.size(); i++) {
            		String id = nodeListArr.get(i).get("id").asText();
            		String name = nodeListArr.get(i).get("name").asText();
            		String nodeType = "";
            		ArrayNode networkArr = (ArrayNode) nodeListArr.get(i).get("network");
            		for(int j=0; j < networkArr.size(); j++) {
            			nodeType = networkArr.get(j).get("nodeType").asText();
            		}
            		
            		HashMap<String, Object> nodeDataMap = new HashMap<String, Object>();
            		
            		nodeDataMap.put("id", id);
            		nodeDataMap.put("name", name);
            		nodeDataMap.put("nodeType", nodeType);
            		
            		resultList.add(nodeDataMap);
            	}
            }
            
		} catch (Exception e) {
			// TODO: handle exception
			LOG.warn(e.getMessage(), e);
		}
		
		
		return resultList;
	}
	
	@Override
	public List<HashMap<String, Object>> selectBlockList(HashMap<String, Object> paramMap) {
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
		
		try {
			 JSONParser parser = new JSONParser();
			 Reader reader = new FileReader("D:\\block_latest.json");
			 JSONObject jsonObject = (JSONObject) parser.parse(reader);
			 String hexString = jsonObject.get("result").toString();
			 String hexStringH = hexString.replaceFirst("^0x", "");
			 int decimal = Integer.parseInt(hexStringH, 16);
			 
			 for(int i=0; i<10; i++) {
				 HashMap<String, Object> blockListMap = new HashMap<String, Object>();
				 
				 blockListMap.put("blockHeightD", decimal);
				 blockListMap.put("blockHeightH", hexString);
				 blockListMap.put("creationNode", "Node #"+decimal);
				 
				 resultList.add(blockListMap);
				 
				 decimal--;
			 }
			 
			 
		} catch (Exception e) {
			// TODO: handle exception
			LOG.warn(e.getMessage(), e);
		}
		return resultList;
	}
	
	@Override
	public HashMap<String, Object> selectBlockInfo(HashMap<String, Object> paramMap) {
		HashMap<String, Object> blockDataMap = new HashMap<String, Object>();
		
		try {
			JSONParser parser = new JSONParser();
			Reader reader = new FileReader("D:\\tx_list_in_block.json");
			JSONObject jsonObject = (JSONObject) parser.parse(reader); 
			
			ObjectMapper mapper = new ObjectMapper();
			
			JsonNode json = mapper.readTree(jsonObject.get("result").toString());
            
            blockDataMap.put("blockscore", json.get("blockscore"));
            blockDataMap.put("gasUsed", json.get("gasUsed"));
            blockDataMap.put("governanceData", json.get("governanceData"));
            blockDataMap.put("hash", json.get("hash"));
            blockDataMap.put("number", json.get("number"));
            
            String hexString = json.get("size").asText();
			String hexStringH = hexString.replaceFirst("^0x", "");
            int blockSize = Integer.parseInt(hexStringH, 16);
            blockDataMap.put("size", blockSize);
		} catch (Exception e) {
			// TODO: handle exception
			LOG.warn(e.getMessage(), e);
		}
		return blockDataMap;
	}
	
	@Override
	public int selectTestSecond(HashMap<String, Object> paramMap) {
		return monitorTxMapper.selectTestSecond(paramMap);
	}
	
	@Override
	public int selectTestFirst(HashMap<String, Object> paramMap) {
		return monitorMapper.selectTestFirst(paramMap);
	}
	
}

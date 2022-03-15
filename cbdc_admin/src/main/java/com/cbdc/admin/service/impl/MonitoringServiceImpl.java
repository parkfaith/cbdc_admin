package com.cbdc.admin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.cbdc.admin.service.MonitoringService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class MonitoringServiceImpl implements MonitoringService{

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
            
            System.out.println("jsonInString==="+jsonInString);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return resultList;
	}
}

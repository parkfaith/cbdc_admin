package com.cbdc.admin.common;

public class MenuAuthCheck {
	
	public synchronized static String authResult(String userAuth, String menuAuth) {
		String result = "ACCEPT";
		int checkCnt = 0;
		//menuauth 가 배열일 때와 텍스트 일때 구분.
		if(menuAuth.contains(",")) {
			String[] menuAuthArr = menuAuth.split(",");
			for(int i=0; i<menuAuthArr.length; i++) {
				if(userAuth.contains(menuAuthArr[i])){
					checkCnt++;
				}else {
					//nothing
				}
			}
		}else {
			if(userAuth.contains(menuAuth)){
				checkCnt++;
			}else {
				//nothing
			}
		}
		
		if(checkCnt > 0) {
			result = "ACCEPT";//버튼 사용 허용
		}else {
			result = "DENY";//버튼 사용 불가
		}
		
		return result;
	}

}

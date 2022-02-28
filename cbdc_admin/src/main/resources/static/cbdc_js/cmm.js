/**
 * 공통 스크립트
 */

/* IE에서 replaceAll 지원X */
String.prototype.replaceAll = function(searchStr, replaceStr) {
	var temp = this;
	while(temp.indexOf(searchStr) != -1) {
		temp = temp.replace(searchStr, replaceStr);
	}
	return temp;
}

var goAjaxCallYN ="N";
var cmm = {
	callAjax : function(url, type, data, callBack) {
		$.ajax({
	        type: type,
	        url: url,
	        data : data,
	        dataType: "json",
	        beforeSend: function() { 
	        	showLoading();
	        },
			complete : function() {
	        	hideLoading();
				navHeightChk();
			},
	        cache: false,
	        success: callBack,
	        error: function (xhr, ajaxOptions, thrownError) {
//	            alert("죄송합니다.\n서버와 통신이 원활하지 않습니다.\n잠시 후 다시 시도바랍니다.");
	        }
	    });	
	},
	goAjaxSaveFCall : function(fun, url, type, dataType, param, async, fAttrNm, forwoardParam, selfHideLoadingYn){
		cmm.time =3601;
		if("Y" == goAjaxCallYN) {
			alert("처리 중 입니다.\n잠시만 기다려 주십시오.");
			return;
		}
		
		goAjaxCallYN ="Y";
		showLoading();
		
		var formData = new FormData();
		$.each(param, function(k,v){
			if(v != undefined){
				formData.append(k+"",v);
			}
		});
		
		$.ajax({
			type: type,
			url: url,
			data: formData,
    	    processData: false,
    	    contentType: false,
			/*enctype: 'multipart/form-data',*/
    	    async: async,
			success: function(ajaxData) {
				goAjaxCallYN ="N";

				if(undefined ==selfHideLoadingYn || 'Y' == selfHideLoadingYn) {
					hideLoading();
				}
				
				if(undefined !=forwoardParam) {
					return fun(ajaxData, forwoardParam);
				}
				return fun(ajaxData);
			},
			error: function(e){
				goAjaxCallYN ="N";
				hideLoading();
				alert("죄송합니다.\n서버와 통신이 원활하지 않습니다.\n잠시 후 다시 시도바랍니다.");
				return;
			}
		});
	},
	Logout : function() {
		if(confirm("로그아웃을 하시겠습니까?")) {
			var newForm = $('<form></form>');
			newForm.attr("method","post"); 
			newForm.attr("action", "/login/ssoLogout.do"); 
			newForm.appendTo('body');
			newForm.submit();
		}
	}
}

/**
 * 유효성 체크 스크립트
 */
var valid = {
	// email
	isEmail : function(val){
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		return regExp.test(val); // 형식에 맞는 경우 true 리턴
	},
	// 전화번호/핸드폰번호 첫번호 제외
	isCelluar : function(val){
		var regExp = /^(?:\d{3}|\d{4})-\d{4}$/;
		return regExp.test(val); // 형식에 맞는 경우 true 리턴
	},
	// 한글, 영문
	isKoEn : function(val){
		var regExp = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/;
		return regExp.test(val); // 형식에 맞는 경우 true 리턴
	},
	// 숫자
	isNum : function(val){
		var regExp = /^[0-9]+$/;
		return regExp.test(val); // 형식에 맞는 경우 true 리턴
	},
	// 날짜
	isDate : function(val){
		var regExp = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 
		return regExp.test(val); // 형식에 맞는 경우 true 리턴
	}
}

/**
 * 시간 스크립트
 */
var cmmDate = {
	formatDateKo : function(date) {
		return date.getFullYear() + '년 ' +  (date.getMonth() + 1) + '월 ' + date.getDate() + '일 ' + date.getHours() + '시 ' + date.getMinutes() + '분 ' + date.getSeconds() + '초' ;
	},
	formatDateYMDHIS : function(date) {
		return date.getFullYear() + '-' +  cmmStr.lpad((date.getMonth() + 1), 2, 0) + '-' + cmmStr.lpad(date.getDate(), 2, 0) 
		+ ' ' + cmmStr.lpad(date.getHours(), 2, 0) + ':' + cmmStr.lpad(date.getMinutes(), 2, 0) + ':' + cmmStr.lpad(date.getSeconds(), 2, 0);
	}
}

/**
 * 문자 스크립트
 */
var cmmStr = {
	/**
	 * 좌측문자열채우기
	 * @params
	 *  - str : 원 문자열
	 *  - padLen : 최대 채우고자 하는 길이
	 *  - padStr : 채우고자하는 문자(char)
	 */
	lpad : function(str, padLen, padStr) {
		if (padStr.length > padLen) {
	        return str;
	    }
	    str += ""; // 문자로
	    padStr += ""; // 문자로
	    while (str.length < padLen) {
	        str = padStr + str;
		}
	    str = str.length >= padLen ? str.substring(0, padLen) : str;
	    return str;
	},
	/**
	 * 우측문자열채우기
	 * @params
	 *  - str : 원 문자열
	 *  - padLen : 최대 채우고자 하는 길이
	 *  - padStr : 채우고자하는 문자(char)
	 */
	rpad : function(str, padLen, padStr) {
		if (padStr.length > padLen) {
	        return str + "";
	    }
	    str += ""; // 문자로
	    padStr += ""; // 문자로
	    while (str.length < padLen) {
	        str += padStr;
		}
	    str = str.length >= padLen ? str.substring(0, padLen) : str;
	    return str;
	},
	characterUnEscapes : function (txt) {
		var unTxt ='';
		unTxt = String(txt).replaceAll("&lt;","<").replaceAll("&gt;",">").replaceAll("&amp;","&").replaceAll("&quot;","\"");
		return unTxt;
	}
	
}

$(document).ready(function(){
	// input 숫자만 허용
	$("input[numberOnly]").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	/*
	//마우스 우클릭 방지
	document.onmousedown=disableclick; 
	
	function disableclick(event){
		if (event.button==2) {
			//alert('우클릭 금지'); 
			return false;
		}
	}
	
	//F12방지
	$(document).bind('keydown',function(e){
		if ( e.keyCode == 123 ) {
			e.preventDefault(); 
			e.returnValue = false;
		}
	 });
*/
})
//마스킹
let maskingFunc = {
	checkNull : function (str){ 
		if(typeof str == "undefined" || str == null || str == ""){ 
			return true; 
		} else{ 
			return false; 
		} 
	},
	email : function(str){
		let originStr = str; 
		let emailStr = originStr.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi); 
		let strLength;
		
		if(this.checkNull(originStr) == true || this.checkNull(emailStr) == true){ 
			return originStr; 
		}else{
			strLength = emailStr.toString().split('@')[0].length - 3;
			//return originStr.toString().replace(new RegExp('.(?=.{0,' + strLength + '}@)', 'g'), '*').replace(/.{6}$/, "******");
			return originStr.toString().replace(new RegExp('.(?=.{0,' + strLength + '}@)', 'g'), '*');
		}
	},
	phone : function(str){ 
		let originStr = str; 
		let phoneStr; 
		let maskingStr; 
		if(this.checkNull(originStr) == true){ 
			return originStr; 
		} 
		
		if (originStr.toString().split('-').length != 3) { // 1) -가 없는 경우 
			phoneStr = originStr.length < 11 ? originStr.match(/\d{10}/gi) : originStr.match(/\d{11}/gi); 
			if(this.checkNull(phoneStr) == true){ 
				return originStr; 
			} 
			
			if(originStr.length < 11) { // 1.1) 0110000000 
				maskingStr = originStr.toString().replace(phoneStr, phoneStr.toString().replace(/(\d{3})(\d{3})(\d{4})/gi,'$1***$3')); 
			} else { // 1.2) 01000000000 
				maskingStr = originStr.toString().replace(phoneStr, phoneStr.toString().replace(/(\d{3})(\d{4})(\d{4})/gi,'$1****$3')); 
			} 
		}else { // 2) -가 있는 경우 
			phoneStr = originStr.match(/\d{2,3}-\d{3,4}-\d{4}/gi); 
			if(this.checkNull(phoneStr) == true){ 
				return originStr; 
			} 
			
			if(/-[0-9]{3}-/.test(phoneStr)) { // 2.1) 00-000-0000 
				maskingStr = originStr.toString().replace(phoneStr, phoneStr.toString().replace(/-[0-9]{3}-/g, "-***-")); 
			} else if(/-[0-9]{4}-/.test(phoneStr)) { // 2.2) 00-0000-0000 
				maskingStr = originStr.toString().replace(phoneStr, phoneStr.toString().replace(/-[0-9]{4}-/g, "-****-")); 
			} 
		} 
	
		return maskingStr; 
	},
	name : function(str){ 
		let originStr = str; 
		let maskingStr; 
		let strLength; 
		if(this.checkNull(originStr) == true){ 
			return originStr; 
		} 
		
		strLength = originStr.length; 
		if(strLength < 3){ 
			maskingStr = originStr.replace(/(?<=.{1})./gi, "*"); 
		}else { 
			maskingStr = originStr.replace(/(?<=.{2})./gi, "*"); 
		} 
	return maskingStr; 
}

}
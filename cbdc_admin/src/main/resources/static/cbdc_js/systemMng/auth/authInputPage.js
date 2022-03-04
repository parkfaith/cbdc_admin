
let searchYN = "N";
let userIdCheckVal = "N";

$(document).ready(function() {
	
	$("#authInsert").click(function(){
		var c = confirm('권한을 등록하시겠습니까?');
        if(c){
        	formCheck("input");
        }
        return false;	
    });

});

function formCheck(style){
	var formData = new FormData($('#authForm')[0]);
	var checkCnt = 0;
	if(formData.get("authNm")==""){
		checkCnt = 1;
	}
	
	/*if(formData.get("authOrderNo")==""){
		checkCnt = 1;
	}*/
	
	if(formData.get("authDesc")==""){
		checkCnt = 1;
	}
	
	if(checkCnt > 0){
		alert("필수 입력사항이 등록되지 않았습니다.");
		return false;
	}else{
		if(style=="input"){
			authSave();
		}else if(style=="update"){
			authUpdate();
		}else{
			
		}
	}
}

function authSave(){
	
	var obj = new Object();
	obj.authNm =$.trim($('#authNm').val());
	obj.authOrderNo =$.trim($('#authOrderNo').val());
	obj.authDesc =$.trim($('#authDesc').val());
	obj.saveType = "C";
	 
	cmm.callAjax('/systemMng/cudAuthInfoAjax.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("권한이 등록되었습니다.");
			var goUrl = "/systemMng/authMngPage.do";
	    	$(location).attr('href',goUrl);
		} else {
			alert("권한 등록에 에러가 발생했습니다.");
			return false;
		}
	});
}
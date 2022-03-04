
let searchYN = "N";
let userIdCheckVal = "N";

$(document).ready(function() {
	
	$("#userInsert").click(function(){
		if(userIdCheckVal=="N"){
			alert('아이디 중복확인을 하셔야 합니다.');
			return false;
		}else{
			var c = confirm('사용자를 등록하시겠습니까?');
	        if(c){
	        	formCheck("input");
	        }
	        return false;	
		}
    });
    
    $('#idChkBtn').click(function(){
	    userIdCheck();
	});
});

function formCheck(style){
	var formData = new FormData($('#userForm')[0]);
	var checkCnt = 0;
	if(formData.get("userId")==""){
		checkCnt = 1;
	}
	
	if(formData.get("userNm")==""){
		checkCnt = 1;
	}
	
	if(checkCnt > 0){
		alert("필수 입력사항이 등록되지 않았습니다.");
		return false;
	}else{
		if(style=="input"){
			userSave();
		}else if(style=="update"){
			userUpdate();
		}else{
			
		}
	}
}

function userSave(){
	
	var obj = new Object();
	obj.userId =$.trim($('#userId').val());
	obj.userNm =$.trim($('#userNm').val());
	obj.saveType = "C";
	 
	cmm.callAjax('/systemMng/cudUserInfoAjax.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("사용자가 등록되었습니다.");
			var goUrl = "/systemMng/userMngPage.do";
	    	$(location).attr('href',goUrl);
		} else {
			alert("사용자 등록에 에러가 발생했습니다.");
			return false;
		}
	});
}

function userIdCheck(){
	var obj = new Object();
	obj.userId =$.trim($('#userId').val());
	
	cmm.callAjax('/systemMng/selectUserIdChk.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if(resultCode > 0) {
			alert("이미 등록된 사용자 아이디 입니다.");
			return false;
		} else {
			alert("사용할 수 있는 아이디입니다.");
			userIdCheckVal = "Y";
		}
	});
}
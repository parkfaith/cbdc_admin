
let searchYN = "N";
let userIdCheckVal = "N";

$(document).ready(function() {
	
	$("#userDeleteBtn").click(function(){
		var c = confirm('사용자를 삭제하시겠습니까?');
        if(c){
        	userDelete();
        }
        return false;
    });
    
    $("#userUpdatePageBtn").click(function(){
		var form = document.userForm;
		
		form.detailType.value = "UPDATE";
    	
    	form.action = "/systemMng/userDetailPage.do";
    	form.method = "post";
    	form.submit();
    });
    
    $("#userUpdateBtn").click(function(){
		let checkUserNm = $.trim($('#userNm').val());
		if(checkUserNm==''||checkUserNm==null){
			alert("사용자 이름을 입력하세요");
			return false;
		}else{
			var c = confirm('사용자를 수정하시겠습니까?');
	        if(c){
	        	userUpdate();
	        }
        return false;	
		}
    });
    
    $("#userCancelBtn").click(function() {
		var form = document.userForm;
		
		form.detailType.value = "";
    	
    	form.action = "/systemMng/userDetailPage.do";
    	form.method = "post";
    	form.submit();
	});

});


function userDelete(){
	
	var obj = new Object();
	obj.userSeq =$.trim($('#userSeq').val());
	obj.saveType = "D";
	 
	cmm.callAjax('/systemMng/cudUserInfoAjax.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("사용자가 삭제되었습니다.");
			var goUrl = "/systemMng/userMngPage.do";
	    	$(location).attr('href',goUrl);
		} else {
			alert("사용자 삭제에 에러가 발생했습니다.");
			return false;
		}
	});
}

function userUpdate(){
	
	var obj = new Object();
	obj.userSeq =$.trim($('#userSeq').val());
	obj.userNm =$.trim($('#userNm').val());
	obj.saveType = "U";
	 
	cmm.callAjax('/systemMng/cudUserInfoAjax.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("사용자가 수정되었습니다.");
			goDetailPage(obj.userSeq);
		} else {
			alert("사용자 수정에 에러가 발생했습니다.");
			return false;
		}
	});
}

function selectAuthName(authCodeStr){
	var obj = new Object();
	obj.authCodeStr = authCodeStr;
	
	let authHtml = "";
	
	cmm.callAjax('/systemMng/selectAuthNameList.json', 'POST', obj, function(data){
		if(data.selectAuthNameListCnt < 1){
			authHtml +='<span class="flag auth">기본권한</span>&nbsp;';
			$('#authNameList').html(authHtml);
		}else{
			$.each(data.selectAuthNameList, function(i,item) {
				authHtml +='<span class="flag auth">'+item.AUTH_NM+'</span>&nbsp;';
			});
			$('#authNameList').empty().html(authHtml);
		}
		
	});
}

function goDetailPage(userSeq){
	var form = document.userForm;
        	
	form.userSeq.value = userSeq;
	
	form.action = "/systemMng/userDetailPage.do";
	form.method = "post";
	form.submit();
}
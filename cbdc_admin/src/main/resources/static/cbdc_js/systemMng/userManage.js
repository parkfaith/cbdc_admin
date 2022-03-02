
let searchYN = "N";
let userIdCheckVal = "N";

$(document).ready(function() {

	$("#btn_Search").click(function() {
		searchYN = "Y";
       	userSearch(1);
	});
	
	$('#btnInput').click(function(){
	    var form = document.userForm;
    	
    	form.action = "/systemMng/userInputPage.do";
    	form.method = "post";
    	form.submit();
	});
	
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
	
	userSearch(1);
});


function userSearch(no){
	var html = "";
	var userTot = "0";
	var param = new Object();
	param.currentPageNum = no;
	param.viewPageCnt    = $('#pageView').val();

	if(searchYN=="Y"){
		param.searchType = $.trim($('#searchType').val());
    	param.searchWord = $.trim($('#searchWord').val());	
    	param.searchSdate = $.trim($('#searchSdate').val());	
		param.searchEdate = $.trim($('#searchEdate').val());	
	}else{
		param.searchType = "";
    	param.searchWord = "";
    	param.searchSdate = "";
		param.searchEdate = "";
	}
	searchYN = "N";
	cmm.callAjax('/systemMng/selectUserList.json', 'POST', param, function(data){
		userTot = data.totalCnt;
		
		if(data.userList.length < 1){
			html +='<tr>';
			html +='<td colspan="8" class="empty">결과가 없습니다.</td>';
			html +='</tr>';
		}else{
			$.each(data.userList, function(i,item) {
    			html +='<tr>';
    			html +='<td class="num">'+item.RN+'</td>'
				html +='<td class="user">'
				html +='<a href="#" onClick="goDetailPage(\''+item.USER_SEQ+'\')">'+item.USER_ID+'</a>'
				html +='</td>'
				html +='<td class="insti">'+item.USER_NM+'</td>'
				html +='<td class="insti">승인/배포</td>'
				html +='<td class="writer">'+item.REG_ID+'</td>'
				html +='<td class="date">'+item.REG_DATE+'</td>'
    			html +='</tr>';
    		});
			var pagingView = data.pagingView;
			var paginationHtml = "";
			if(pagingView != null) {
				paginationHtml = pagingView;
			}
		}
		
		var pageHtml = cmmStr.characterUnEscapes(paginationHtml);
		$('#userList').empty().html(html);
		$('#totalCnt').text(userTot);
		if(pagingView != null) {
			$('#pagination').empty().append(pageHtml);
		}
		
	});
}

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

function goDetailPage(userSeq){
	var form = document.userForm;
        	
	form.userSeq.value = userSeq;
	//form.searchTypeVal.value = searchTypeVal;
	//form.searchWordVal.value = searchWordVal;
	form.action = "/systemMng/userDetailPage.do";
	form.method = "post";
	form.submit();
}

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
        
function fnGoPaging(no) {
	userSearch(no);
}
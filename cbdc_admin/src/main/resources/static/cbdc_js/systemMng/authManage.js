
let searchYN = "N";
let userIdCheckVal = "N";

$(document).ready(function() {

	$("#btn_Search").click(function() {
		searchYN = "Y";
       	authSearch(1);
	});
	
	$('#btnInput').click(function(){
	    var form = document.authForm;
    	
    	form.action = "/systemMng/authInputPage.do";
    	form.method = "post";
    	form.submit();
	});
	
	$("#authInsert").click(function(){
		var c = confirm('권한을 등록하시겠습니까?');
        if(c){
        	formCheck("input");
        }
        return false;	
    });
    
	$("#authDeleteBtn").click(function(){
		var c = confirm('권한을 삭제하시겠습니까?');
        if(c){
        	authDelete();
        }
        return false;
    });
    
    $("#authUpdatePageBtn").click(function(){
		var form = document.authForm;
		form.detailType.value = "UPDATE";
    	
    	form.action = "/systemMng/authDetailPage.do";
    	form.method = "post";
    	form.submit();
    });
    
    $("#authUpdateBtn").click(function(){
		let checkAuthNm = $.trim($('#authNm').val());
		let checkAuthDesc = $.trim($('#authDesc').val());
		let checkCnt = 0;
		if(checkAuthNm==''||checkAuthNm==null){
			checkCnt = 1;
		}
		
		if(checkAuthDesc==''||checkAuthDesc==null){
			checkCnt = 1;
		}
		
		if(checkCnt > 0){
			alert("필수 입력사항이 등록되지 않았습니다.");
		}else{
			var c = confirm('권한을 수정하시겠습니까?');
	        if(c){
	        	authUpdate();
	        }
        return false;	
		}
    });
    
    $("#authCancelBtn").click(function() {
		var form = document.authForm;
		form.detailType.value = "";
    	
    	form.action = "/systemMng/authDetailPage.do";
    	form.method = "post";
    	form.submit();
	});
	
	authSearch(1);
});


function authSearch(no){
	var html = "";
	var authTot = "0";
	var param = new Object();
	param.currentPageNum = no;
	param.viewPageCnt    = $('#pageView').val();

	if(searchYN=="Y"){
    	param.searchWord = $.trim($('#searchWord').val());	
	}else{
    	param.searchWord = "";
	}
	searchYN = "N";
	cmm.callAjax('/systemMng/selectAuthList.json', 'POST', param, function(data){
		authTot = data.totalCnt;
		
		if(data.authList.length < 1){
			html +='<tr>';
			html +='<td colspan="8" class="empty">결과가 없습니다.</td>';
			html +='</tr>';
		}else{
			$.each(data.authList, function(i,item) {
    			html +='<tr>';
    			html +='<td class="num">'+item.RN+'</td>'
    			html +='<td class="code">'+item.AUTH_CODE+'</td>'
				html +='<td class="auth">'
				html +='<a href="#" onClick="goDetailPage(\''+item.AUTH_SEQ+'\')">'+item.AUTH_NM+'</a>'
				html +='</td>'
				html +='<td class="code">'+item.AUTH_DESC+'</td>'
				html +='<td class="cnt">'+item.AUTH_USERCNT+'</td>'
				html +='<td class="cnt">'+item.AUTH_ORDERNO+'</td>'
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
		$('#authList').empty().html(html);
		$('#totalCnt').text(authTot);
		if(pagingView != null) {
			$('#pagination').empty().append(pageHtml);
		}
		
	});
}

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

function goDetailPage(authSeq){
	var form = document.authForm;
        	
	form.authSeq.value = authSeq;
	
	form.action = "/systemMng/authDetailPage.do";
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

function authUpdate(){
	
	let obj = new Object();
	obj.authSeq =$.trim($('#authSeq').val());
	obj.authNm =$.trim($('#authNm').val());
	obj.authDesc =$.trim($('#authDesc').val());
	obj.saveType = "U";
	 
	cmm.callAjax('/systemMng/cudAuthInfoAjax.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("권한이 수정되었습니다.");
			goDetailPage(obj.authSeq);
		} else {
			alert("권한 수정에 에러가 발생했습니다.");
			return false;
		}
	});
}
        
function fnGoPaging(no) {
	authSearch(no);
}
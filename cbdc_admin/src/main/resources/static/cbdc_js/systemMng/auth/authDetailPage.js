
let searchYN = "N";
let userIdCheckVal = "N";

$(document).ready(function() {
	$("#btn_userSearch").click(function() {
		searchYN = "Y";
       	authUserList(1);
	});

	$("#authDeleteBtn").click(function(){
		let checkCnt = $("#checkAuthUserCnt").text();
		if(checkCnt > 0){
			alert("권한사용자가 존재하므로 권한삭제를 할 수 없습니다.");
			return false;
		}else{
			var c = confirm('권한을 삭제하시겠습니까?');
        	if(c){
        		authDelete();
        	}
        	return false;	
		}
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
	
	$("#addMemAuth").click(function(){
		select_obj = '';
		var len = $("input[name='chkUser']:checked").length;
		if(len < 1){
			alert("최소한 하나는 선택되어야 합니다");
		}else{
			var c = confirm('선택한 사용자를 권한에서 추가하시겠습니까?');
			if(c){
				$("input[name='chkUser']:checked").each(function (index) {
		            if (index != 0) {
		                select_obj += ',';
		            }
		            select_obj += $(this).val();
		            
		        });	
				authUserSave(select_obj);	
			}
			
		}
	});
	
	$("#delAuth").click(function(){
		select_obj = '';
		var len = $("input[name='chkListUser']:checked").length;
		if(len < 1){
			alert("삭제할 사용자를 선택해주세요!");
		}else{
			var c = confirm('선택한 사용자를 권한에서 삭제하시겠습니까?');
			if(c){
				$("input[name='chkListUser']:checked").each(function (index) {
		            if (index != 0) {
		                select_obj += ',';
		            }
		            select_obj += $(this).val();
		            
		        });	
				authUserDelete(select_obj);	
			}
			
		}
	});
});

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
	authUserList(no);
}

function authUserList(no){
	var html = "";
	var userTot = "0";
	var param = new Object();
	param.currentPageNum = no;
	param.viewPageCnt    = $('#pageView').val();
	param.authCode    = $('#authCode').val();

	if(searchYN=="Y"){
		param.searchType = $.trim($('#searchType').val());
    	param.searchWord = $.trim($('#searchWord').val());	
	}else{
		param.searchType = "";
    	param.searchWord = "";
	}
	searchYN = "N";
	cmm.callAjax('/systemMng/selectAuthUserList.json', 'POST', param, function(data){
		userTot = data.authUserListTot;
		
		if(data.authUserList.length < 1){
			html +='<tr>';
			html +='<td colspan="4" class="empty">결과가 없습니다.</td>';
			html +='</tr>';
		}else{
			$.each(data.authUserList, function(i,item) {
    			html +='<tr>';
    			html +='<td class="num"><label><input type="checkbox" class="authChk" name="chkListUser" id="chkListUser" value="'+item.USER_SEQ+'"></label></td>'
				html +='<td class="user">'+item.USER_ID+'</td>'
				html +='<td class="insti">'+item.USER_NM+'</td>'
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
		$('#authUserList').empty().html(html);
		$('#selectAuthUserTotalCount').text(userTot);
		if(pagingView != null) {
			$('#pagination').empty().append(pageHtml);
		}
		
	});
}

function authUserListPop(no){
	let htmlpop = "";
	let userTotpop = "0";
	let param = new Object();
	let paginationHtmlpop = "";
	let pagingViewpop = "";
	param.currentPageNum = no;
	param.viewPageCnt    = $('#pageViewpop').val();

	if(searchYN=="Y"){
		param.searchType = $.trim($('#searchTypepop').val());
    	param.searchWord = $.trim($('#searchWordpop').val());	
    	param.searchSdate = ""	
		param.searchEdate = ""	
	}else{
		param.searchType = "";
    	param.searchWord = "";
    	param.searchSdate = "";
		param.searchEdate = "";
	}
	searchYN = "N";
	cmm.callAjax('/systemMng/selectUserList.json', 'POST', param, function(data){
		userTotpop = data.totalCnt;
		
		if(data.userList.length < 1){
			htmlpop +='<tr>';
			htmlpop +='<td colspan="4" class="empty">결과가 없습니다.</td>';
			htmlpop +='</tr>';
		}else{
			$.each(data.userList, function(i,item) {
    			htmlpop +='<tr>';
    			htmlpop +='<td class="num"><label><input type="checkbox" class="authChk" name="chkUser" id="chkUser" value="'+item.USER_SEQ+'"></label></td>'
				htmlpop +='<td class="user">'+item.USER_ID+'</td>'
				htmlpop +='<td class="insti">'+item.USER_NM+'</td>'
				htmlpop +='<td class="date">'+item.REG_DATE+'</td>'
    			htmlpop +='</tr>';
    		});
			pagingViewpop = data.pagingView;
			
			if(pagingViewpop != null) {
				paginationHtmlpop = pagingViewpop;
			}
		}
		
		var pageHtmlpop = cmmStr.characterUnEscapes(paginationHtmlpop);
		$('#userListpop').empty().html(htmlpop);
		$('#totalCntpop').text(userTotpop);
		if(pagingViewpop != null) {
			$('#paginationpop').empty().append(pageHtmlpop);
		}
	});
}

function authUserSave(select_obj){
	
	var obj = new Object();
	obj.authUserArr =select_obj;
	obj.authCode =$.trim($('#authCode').val());
	obj.authSeq =$.trim($('#authSeq').val());
	obj.saveType = 'C';

	cmm.callAjax('/systemMng/authUserInDel.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("권한 사용자가 등록되었습니다.");
			goDetailPage(obj.authSeq)
		} else {
			alert("권한 사용자 등록에 에러가 발생했습니다.");
			return false;
		}
	});
}

function authUserDelete(select_obj){
	
	var obj = new Object();
	obj.authUserArr =select_obj;
	obj.authCode =','+$.trim($('#authCode').val());
	obj.authSeq =$.trim($('#authSeq').val());
	obj.saveType = 'D';

	cmm.callAjax('/systemMng/authUserInDel.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("사용자에 대한 권한이 삭제되었습니다.");
			goDetailPage(obj.authSeq)
		} else {
			alert("권한 사용자 삭제에 에러가 발생했습니다.");
			return false;
		}
	});
}
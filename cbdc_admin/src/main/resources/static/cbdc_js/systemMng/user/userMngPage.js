
let searchYN = "N";

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
				html +='<td class="insti"><span class="flag auth">승인/배포</span></td>'
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

function goDetailPage(userSeq){
	var form = document.userForm;
        	
	form.userSeq.value = userSeq;
	//form.searchTypeVal.value = searchTypeVal;
	//form.searchWordVal.value = searchWordVal;
	form.action = "/systemMng/userDetailPage.do";
	form.method = "post";
	form.submit();
}
     
function fnGoPaging(no) {
	userSearch(no);
}
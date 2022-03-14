
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
				//html +='<td class="cnt">'+item.AUTH_ORDERNO+'</td>'
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

function goDetailPage(authSeq){
	var form = document.authForm;
        	
	form.authSeq.value = authSeq;
	
	form.action = "/systemMng/authDetailPage.do";
	form.method = "post";
	form.submit();
}
      
function fnGoPaging(no) {
	authSearch(no);
}

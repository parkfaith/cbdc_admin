
let searchYN = "N";

$(document).ready(function() {

	$("#btn_Search").click(function() {
		searchYN = "Y";
       	nodeSearch(1);
	});
	
	$('#btnInput').click(function(){
	    var form = document.nodeForm;
    	
    	form.action = "/nodeMng/nodeInputPage.do";
    	form.method = "post";
    	form.submit();
	});
	
	nodeSearch(1);
});


function nodeSearch(no){
	var html = "";
	var nodeTot = "0";
	var param = new Object();
	param.currentPageNum = no;
	param.viewPageCnt    = $('#pageView').val();

	if(searchYN=="Y"){
		param.searchType = $.trim($('#searchType').val());
    	param.searchWord = $.trim($('#searchWord').val());	
    	param.searchOrg = $.trim($('#searchOrg').val());	
		param.searchNodeType = $.trim($('#searchNodeType').val());	
	}else{
		param.searchType = "";
    	param.searchWord = "";
    	param.searchOrg = "";
		param.searchNodeType = "";
	}
	searchYN = "N";
	cmm.callAjax('/nodeMng/selectNodeList.json', 'POST', param, function(data){
		nodeTot = data.totalCnt;
		
		if(data.nodeList.length < 1){
			html +='<tr>';
			html +='<td colspan="9" class="empty">결과가 없습니다.</td>';
			html +='</tr>';
		}else{
			$.each(data.nodeList, function(i,item) {
    			html +='<tr>';
    			html +='<td class="num">'+item.RN+'</td>'
				html +='<td>'
				html +='<a href="#" onClick="goDetailPage(\''+item.NODE_SEQ+'\')">'+item.NODE_NM+'</a>'
				html +='</td>'
				html +='<td class="insti">'+item.NODE_ORG+'</td>'
				html +='<td class="sts"><span class="node '+item.NODE_TYPE+'">'+item.NODE_TYPE+'</span></td>'
				html +='<td class="insti">'+item.NODE_IP+'</td>'
				html +='<td class="insti">'+item.NODE_PORT1+'</td>'
				html +='<td class="insti">'+item.NODE_PORT2+'</td>'
				html +='<td class="writer">'+item.REG_NM+'</td>'
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
		$('#nodeList').empty().html(html);
		$('#totalCnt').text(nodeTot);
		if(pagingView != null) {
			$('#pagination').empty().append(pageHtml);
		}
		
	});
}

function goDetailPage(nodeSeq){
	var form = document.nodeForm;
        	
	form.nodeSeq.value = nodeSeq;

	form.action = "/nodeMng/nodeDetailPage.do";
	form.method = "post";
	form.submit();
}
     
function fnGoPaging(no) {
	nodeSearch(no);
}
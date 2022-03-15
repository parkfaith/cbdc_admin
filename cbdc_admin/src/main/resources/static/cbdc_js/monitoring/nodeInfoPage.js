
$(document).ready(function() {

	
});

function nodeList(){
	let param = new Object();
	param.currentPageNum = no;
	param.viewPageCnt    = $('#pageView').val();
	
	cmm.callAjax('/monitoring/selectNodeList.json', 'POST', param, function(data){
		
	});
}
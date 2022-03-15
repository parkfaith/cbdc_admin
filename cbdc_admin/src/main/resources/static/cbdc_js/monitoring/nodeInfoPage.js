
$(document).ready(function() {
	nodeList();	
});

function nodeList(){
	let param = new Object();
	
	cmm.callAjax('/monitoring/selectNodeList.json', 'POST', param, function(data){
		
	});
}
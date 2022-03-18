
let searchYN = "N";
let nodeIdCheckVal = "N";

$(document).ready(function() {
	
	$("#nodeDeleteBtn").click(function(){
		var c = confirm('노드를 삭제하시겠습니까?');
        if(c){
        	nodeDelete();
        }
        return false;
    });
    
    $("#nodeUpdatePageBtn").click(function(){
		var form = document.nodeForm;
		
		form.detailType.value = "UPDATE";
    	
    	form.action = "/nodeMng/nodeDetailPage.do";
    	form.method = "post";
    	form.submit();
    });
    
    $("#nodeUpdateBtn").click(function(){
		let nodeNm =$.trim($('#nodeNm').val());
		let nodeOrg =$.trim($('#nodeOrg').val());
		let nodeType =$.trim($('#nodeType').val());
		let nodePubKey =$.trim($('#nodePubKey').val());
		let nodeIp =$.trim($('#nodeIp').val());
		let nodePort1 =$.trim($('#nodePort1').val());
		let nodePort2 =$.trim($('#nodePort2').val());
		let nodePrometPort =$.trim($('#nodePrometPort').val());
		let checkCnt = 0;
		
		if(nodeNm==""){
			checkCnt = 1;
		}
		
		if(nodeOrg==""){
			checkCnt = 1;
		}
		
		if(nodeType==""){
			checkCnt = 1;
		}
		
		if(nodePubKey==""){
			checkCnt = 1;
		}
		
		if(nodeIp==""){
			checkCnt = 1;
		}
		
		if(nodePort1==""){
			checkCnt = 1;
		}
		
		if(nodePort2==""){
			checkCnt = 1;
		}
		
		if(nodePrometPort==""){
			checkCnt = 1;
		}
		
		if(checkCnt > 0){
			alert("필수 입력사항이 등록되지 않았습니다.");
			return false;
		}else{
			let c = confirm('노드를 수정하시겠습니까?');
	        if(c){
	        	nodeUpdate();
	        }
	        return false;
		}
    });
    
    $("#nodeCancelBtn").click(function() {
		var form = document.nodeForm;
		
		form.detailType.value = "";
    	
    	form.action = "/nodeMng/nodeDetailPage.do";
    	form.method = "post";
    	form.submit();
	});

});


function nodeDelete(){
	
	var obj = new Object();
	obj.nodeSeq =$.trim($('#nodeSeq').val());
	obj.saveType = "D";
	 
	cmm.callAjax('/nodeMng/cudNodeInfoAjax.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("노드가 삭제되었습니다.");
			var goUrl = "/nodeMng/nodeMngPage.do";
	    	$(location).attr('href',goUrl);
		} else {
			alert("노드 삭제에 에러가 발생했습니다.");
			return false;
		}
	});
}

function nodeUpdate(){
	
	var obj = new Object();
	obj.nodeSeq =$.trim($('#nodeSeq').val());
	obj.nodeNm =$.trim($('#nodeNm').val());
	obj.nodeOrg =$.trim($('#nodeOrg').val());
	obj.nodeType =$.trim($('#nodeType').val());
	obj.nodePubkey =$.trim($('#nodePubkey').val());
	obj.nodeIp =$.trim($('#nodeIp').val());
	obj.nodePort1 =$.trim($('#nodePort1').val());
	obj.nodePort2 =$.trim($('#nodePort2').val());
	obj.nodePrometPort =$.trim($('#nodePrometPort').val());
	obj.saveType = "U";
	 
	cmm.callAjax('/nodeMng/cudNodeInfoAjax.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("노드가 수정되었습니다.");
			goDetailPage(obj.nodeSeq);
		} else {
			alert("노드 수정에 에러가 발생했습니다.");
			return false;
		}
	});
}

function goDetailPage(nodeSeq){
	let form = document.nodeForm;
        	
	form.nodeSeq.value = nodeSeq;
	
	form.action = "/nodeMng/nodeDetailPage.do";
	form.method = "post";
	form.submit();
}
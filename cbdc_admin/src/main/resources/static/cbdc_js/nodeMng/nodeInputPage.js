
let searchYN = "N";
let userIdCheckVal = "N";

$(document).ready(function() {
	
	$("#nodeInsert").click(function(){
		var c = confirm('노드를 등록하시겠습니까?');
        if(c){
        	formCheck("input");
        }
        return false;
    });
});

function formCheck(style){
	let formData = new FormData($('#nodeForm')[0]);
	let checkCnt = 0;
	if(formData.get("nodeNm")==""){
		checkCnt = 1;
	}
	
	if(formData.get("nodePubKey")==""){
		checkCnt = 1;
	}
	
	if(formData.get("nodeIp")==""){
		checkCnt = 1;
	}
	
	if(formData.get("nodePort1")==""){
		checkCnt = 1;
	}
	
	if(formData.get("nodePort2")==""){
		checkCnt = 1;
	}
	
	if(formData.get("nodePrometPort")==""){
		checkCnt = 1;
	}
	
	if(checkCnt > 0){
		alert("필수 입력사항이 등록되지 않았습니다.");
		return false;
	}else{
		if(style=="input"){
			nodeSave();
		}else if(style=="update"){
			nodeUpdate();
		}else{
			
		}
	}
}

function nodeSave(){
	
	var obj = new Object();
	obj.nodeNm =$.trim($('#nodeNm').val());
	obj.nodeOrg =$.trim($('#nodeOrg').val());
	obj.nodeType =$.trim($('#nodeType').val());
	obj.nodePubKey =$.trim($('#nodePubKey').val());
	obj.nodeIp =$.trim($('#nodeIp').val());
	obj.nodePort1 =$.trim($('#nodePort1').val());
	obj.nodePort2 =$.trim($('#nodePort2').val());
	obj.nodePrometPort =$.trim($('#nodePrometPort').val());
	obj.saveType = "C";
	 
	cmm.callAjax('/nodeMng/cudNodeInfoAjax.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("노드가 등록되었습니다.");
			var goUrl = "/nodeMng/nodeMngPage.do";
	    	$(location).attr('href',goUrl);
		} else {
			alert("노드 등록에 에러가 발생했습니다.");
			return false;
		}
	});
}
$(window).ready(function(){
	inputCode();
	//callEditor("editor1","python");
	
	
	$("#confirm").click(function(){
		var obj = new Object();
		
		obj.contSeq = $("#status").data('seq');
		obj.status = "승인";
		obj.conBtn= "ACCEPT";
		obj.saveType= "CC";
		
		var c = confirm("스마트계약 등록을 승인하시겠습니까?");
		if(c) {
			cmm.callAjax('/smartCont/smartContInfo.json','POST',obj,function(){
				alert("스마트계약 등록이 승인 되었습니다.");
				location.reload();
			});
		}
	});
	
	
	$("#rejSave").click(function(){
		
		var obj = new Object();
		
		obj.contSeq = $("#status").data('seq');
		obj.status = "반려";
		obj.conBtn= "REJECT";
		obj.rejComm = $("#rejectComm").val();
		obj.saveType= "CC";
		
		var c = confirm("스마트계약 등록을 반려하시겠습니까?");
		if(c) {
			cmm.callAjax('/smartCont/smartContInfo.json','POST',obj,function(){
				alert("스마트계약 등록이 반려 되었습니다.");
				location.reload();
			});
		}
	});
	
});


var editor1 = CodeMirror.fromTextArea(document.getElementById("editor1"), {
	mode: { name: "python",
    	    version: 3,
			singleLineStringErrors: false},
            lineNumbers: true,
            indentUnit: 4,
            matchBrackets: true,
            readOnly: true
});

function inputCode() {
	var inputCode = editor1.getValue();
	$('#inputDataCode').html(inputCode);
}

function copyAdd(elementId){
	var aux = document.createElement("input");
		aux.setAttribute("value", document.getElementById(elementId).innerText);
		document.body.appendChild(aux);
		aux.select();
		document.execCommand("copy");
		document.body.removeChild(aux);
		alert('지갑주소가 복사되었습니다.');
}
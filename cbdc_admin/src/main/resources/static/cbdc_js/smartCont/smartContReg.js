$(document).ready(function() {
	$("#saveCont").click(function(){
		formChk();
	});
});

var editor1 = CodeMirror.fromTextArea(document.getElementById("editor1"), {
	mode: { name: "python",
			version: 3,
			singleLineStringErrors: false},
	lineNumbers: true,
	indentUnit: 4,
	matchBrackets: true
});

var editor2 = CodeMirror.fromTextArea(document.getElementById("editor2"), {
	mode: { name: "python",
			version: 3,
			singleLineStringErrors: false},
	lineNumbers: true,
	indentUnit: 4,
	matchBrackets: true
});

var editor3 = CodeMirror.fromTextArea(document.getElementById("editor3"), {
	mode: { name: "text",
			version: 3,
			singleLineStringErrors: false},
	lineNumbers: true,
	indentUnit: 4,
	matchBrackets: true
});

function formChk(){
	let emptyVal = 0;
	
	if($("#contNm").val() == "") {
		emptyVal++;
	}
	if($("#contDesc").val() == "") {
		emptyVal++;
	}
	if($("#fromAddr").val() == "") {
		emptyVal++;
	}
	if($("#ver").val() == "") {
		emptyVal++;
	}
	if($("#contId").val() == "") {
		emptyVal++;
	}
	
	var editor1Val = editor1.getValue().replace(/ /gi,'');
	var editor2Val = editor2.getValue().replace(/ /gi,'');
	var editor3Val = editor3.getValue().replace(/ /gi,'');
	
	if(editor1Val == "") {
		emptyVal++;
	}
	if(editor2Val == "") {
		emptyVal++;
	}
	if(editor3Val == "") {
		emptyVal++;
	}
	
	if(emptyVal > 0) {
		alert("유효하지 않은 입력값이 " + emptyVal + "개 있습니다.");
		return;
	}else{
		var c = confirm("스마트계약을 등록 하시겠습니까?");
		if(c) {
			saveCont();
		}
	}
	
	
}

function saveCont() {
	let obj = new Object();
	
	obj.saveType = "C";
	obj.contNm = $("#contNm").val();
	obj.contDesc = $("#contDesc").val();
	obj.fromAddr = $("#fromAddr").val();
	obj.ver = $("#ver").val();
	obj.contId = $("#contId").val();
	obj.editor1 = editor1.getValue();
	obj.editor2 = editor2.getValue();
	obj.editor3 = editor3.getValue();
	
	cmm.callAjax('/smartCont/smartContInfo.json','POST',obj,function(data){
		if(data.resultCode == '200') {
			alert("스마트계약이 등록 되었습니다.");
			location.href = "/smartCont/smartContMngPage.do";
		}else if(data.resultCode == '500') {
			alert("스마트계약 등록에 실패하였습니다.");
		}
	});
}
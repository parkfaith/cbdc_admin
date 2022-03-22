$(window).ready(function(){
	/*$("#codeChk").click(function(){
		var c = confirm('코드 검증을 실행하시겠습니까?');
		if(c){
			loading();
			setTimeout(function(){
				hideLoading();
				location.href='smartContMngDeploy.html';
			},1000);
		}
	});*/
	
	$("#updateCont").click(function(){
		let obj = new Object();
	
		obj.saveType = "U";
		obj.contSeq = $("#contSeq").val();
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
				alert("수정이 완료되었습니다.");
			}else if(data.resultCode == '500') {
				alert("수정에 실패하였습니다.");
			}
		});
		
	});
	
	
	
});

        var editor1 = CodeMirror.fromTextArea(document.getElementById("editor1"), {
            mode: {name: "python",
                version: 3,
                singleLineStringErrors: false},
            lineNumbers: true,
            indentUnit: 4,
            matchBrackets: true,
            readOnly: false
        });

        var editor2 = CodeMirror.fromTextArea(document.getElementById("editor2"), {
            mode: {name: "python",
                version: 3,
                singleLineStringErrors: false},
            lineNumbers: true,
            indentUnit: 4,
            matchBrackets: true,
            readOnly: false
        });

        var editor3 = CodeMirror.fromTextArea(document.getElementById("editor3"), {
            mode: {name: "text",
                version: 3,
                singleLineStringErrors: false},
            lineNumbers: true,
            indentUnit: 4,
            matchBrackets: true,
            readOnly: false
        });


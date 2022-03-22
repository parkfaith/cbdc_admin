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
	
	//수정
	$("#updateCont").click(function(){
		/*var form = document.contForm;
        	
		//form.contSeq.value = $("#contSeq").val();
		form.type.value = "U";
		form.action = "/smartCont/smartContDetail.do";
		form.method = "post";
		form.submit();*/
		
		var reqData = "";
			
			reqData += "type=U"
					+ "&contSeq="
					+ $("#contSeq").val();

		location.href ="/smartCont/smartContDetail.do?" + reqData;
	});
	
	//삭제
	$("#deleteCont").click(function(){
        let obj = new Object();
	
		obj.saveType = "D";
		obj.contSeq = $("#contSeq").val();	
		var c = confirm("삭제 하시겠습니까?");
		if(c) {
			cmm.callAjax('/smartCont/smartContInfo.json','POST',obj,function(data){
				if(data.resultCode == '200') {
					alert("삭제가 완료되었습니다.");
					location.href = "/smartCont/smartContMngPage.do";
				}else if(data.resultCode == '500') {
					alert("삭제에 실패하였습니다.");
				}
			});
		}
	});
	
	//코드점검
	$("#codeChk").click(function(){
		
		let obj = new Object();
		obj.saveType = 'CC'; //CheckCode
		obj.contSeq = $("#contSeq").val(); //계약SEQ
		obj.status = '점검완료'; //smart_status
		obj.conBtn = 'CHECKCODE';
		
		var c = confirm("코드점검을 진행하시겠습니까?");
		//진행이 완료되면 Deploy page로 변경
		if(c) {
			//loading();
			cmm.callAjax('/smartCont/smartContInfo.json','POST',obj,function(data){
				if(data.resultCode == '200') {
					alert("코드점검이 완료 되었습니다.");
					
					var reqData = ""; 
						
						reqData += "type=CC"
								+ "&contSeq="
								+  $("#contSeq").val();
					
					//hideLoading();
					location.href ="/smartCont/smartContDetail.do?" + reqData;
				}
			});
		}
	});
});


        var editor1 = CodeMirror.fromTextArea(document.getElementById("editor1"), {
            mode: {name: "python",
                version: 3,
                singleLineStringErrors: false},
            lineNumbers: true,
            indentUnit: 4,
            matchBrackets: true,
            readOnly: true
        });

        var editor2 = CodeMirror.fromTextArea(document.getElementById("editor2"), {
            mode: {name: "python",
                version: 3,
                singleLineStringErrors: false},
            lineNumbers: true,
            indentUnit: 4,
            matchBrackets: true,
            readOnly: true
        });

        var editor3 = CodeMirror.fromTextArea(document.getElementById("editor3"), {
            mode: {name: "text",
                version: 3,
                singleLineStringErrors: false},
            lineNumbers: true,
            indentUnit: 4,
            matchBrackets: true,
            readOnly: true
        });

        function copyAdd(elementId){
            var aux = document.createElement("input");
            aux.setAttribute("value", document.getElementById(elementId).innerText);
            document.body.appendChild(aux);
            aux.select();
            document.execCommand("copy");
            document.body.removeChild(aux);
            alert('지갑주소가 복사되었습니다.');
        }
        
        
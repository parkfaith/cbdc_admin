
$(document).ready(function() {

	$("#savePass").click(function() {
		if( !$("#currentPass").val() ){
		    alert("현재 비밀번호를 입력해주세요."); 
		    $("#currentPass").focus();
		}else if(!chkPW($("#currentPass").val())){
		    alert("비밀번호를 확인해주세요."); 
		    $("#currentPass").focus();
		}else if( !$("#newPass").val() ){
		    alert("새 비밀번호를 입력해주세요."); 
		    $("#newPass").focus();
		}else if( !chkPW($("#newPass").val()) ){
		    alert("형식에 맞게 입력해주세요."); 
		    $("#newPass").focus();
		    $("#passInfo").removeClass('dipnone');
		}else if( !$("#chkPass").val() || $("#newPass").val() != $("#chkPass").val() ){
		    alert("비밀번호를 확인해주세요."); 
		    $("#chkPass").focus();
		    $("#passInfo").addClass('dipnone');
		}else{
		    var c = confirm('비밀번호를 변경하시겠습니까?');
		    if(c){
		        passwordUpdate();
		    }
		}
		return false;
	});
	
	$('#cancelPass').click(function(){
		window.history.back();
		return false;
	});
	
	$("#savePassFirst").click(function() {
		if( !$("#currentPass").val() ){
		    alert("현재 비밀번호를 입력해주세요."); 
		    $("#currentPass").focus();
		}else if(!chkPW($("#currentPass").val())){
		    alert("비밀번호를 확인해주세요."); 
		    $("#currentPass").focus();
		}else if( !$("#newPass").val() ){
		    alert("새 비밀번호를 입력해주세요."); 
		    $("#newPass").focus();
		}else if( !chkPW($("#newPass").val()) ){
		    alert("형식에 맞게 입력해주세요."); 
		    $("#newPass").focus();
		}else if( !$("#chkPass").val() || $("#newPass").val() != $("#chkPass").val() ){
		    alert("비밀번호를 확인해주세요."); 
		    $("#chkPass").focus();
		}else{
		    var c = confirm('비밀번호를 변경하시겠습니까?');
		    if(c){
		        passwordUpdate();
		    }
		}
		return false;
	});
	
});

function passwordUpdate(){
    	
	let obj = new Object();
	obj.nowPass =$.trim($('#currentPass').val());
	obj.changePass =$.trim($('#newPass').val());
	obj.checkPass =$.trim($('#chkPass').val());
	 
	cmm.callAjax('/passwordChange.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("비밀번호가 변경되었습니다. 변경된 비밀번호로 다시 로그인 해 주세요");
			var goUrl = "/login/loginOutProc.do";
			$(location).attr('href',goUrl);
		} else if("300" == resultCode) {
			alert("현재 비밀번호가 틀립니다.");
			return false;
		} else {
			alert("비밀번호 변경에 에러가 발생했습니다.");
			return false;
		}
	});
}

 function chkPW(pw){
	/*
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    if(pw.length < 8 || pw.length > 20){
        return false;
    }else if(pw.search(/\s/) != -1){
        return false;
    }else if(num < 0 || eng < 0 || spe < 0 ){
        return false;
    }else {
        return true;
    }
	*/
	return true;
}

 
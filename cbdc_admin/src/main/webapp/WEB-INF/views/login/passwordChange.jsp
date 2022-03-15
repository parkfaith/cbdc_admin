<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/import/cbdcAdminCommonScript.jsp"/>
    <script>
    $(document).ready(function() {
    	$("#passChangeBtn").click(function() {
    		passwordUpdate();
    	});
    });
    
    function passwordUpdate(){
    	
    	let obj = new Object();
    	obj.nowPass =$.trim($('#nowPass').val());
    	obj.changePass =$.trim($('#changePass').val());
    	obj.checkPass =$.trim($('#checkPass').val());
    	 
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
    </script>
</head>
<body>
	<div class="mainContent nav-login"></div>
    <div class="loginBox">
        <div class="loginTop">
            <span class="bokLogo"></span>
            <h2>
                CBDC ADMIN
                <b>비밀번호 변경</b>
            </h2>
        </div>
        <div class="loginBody">
        	<form name="changePassForm" id="changePassForm">
            <ul>
            	<li>
                    <input type="password" placeholder="현재비밀번호" id="nowPass" name="nowPass">
                </li>
                <li>
                    <input type="password" placeholder="변경비밀번호" id="changePass" name="changePass">
                </li>
                <li>
                    <input type="password" placeholder="비밀번호확인" id="checkPass" name="checkPass">
                </li>
                <li>
                    <a href="#none" class="loginBtn" id="passChangeBtn">확인</a>
                </li>
            </ul>
            </form>
            <p class="sub">
                아이디/비밀번호 분실 시 관리자에게 문의 해주세요. <br>
                연락처 : 02-000-0000
            </p>
        </div>
    </div>
    <div class="loginFt">
        <span class="loginBtmLogo"><img src="../img/common/bok_btm_logo.png" alt="한국은행CI"></span>
        <span class="loginBtmCp">Bank of Korea ⓒ 2021</span>
    </div>
</body>

</html>
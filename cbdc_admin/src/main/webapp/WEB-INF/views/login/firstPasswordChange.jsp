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
                    <input type="password" placeholder="현재비밀번호" id="currentPass" name="currentPass">
                </li>
                <li>
                    <input type="password" placeholder="변경비밀번호" id="newPass" name="newPass">
                </li>
                <li>
                    <input type="password" placeholder="비밀번호확인" id="chkPass" name="chkPass">
                </li>
                <li>
                    <a href="#none" class="loginBtn" id="savePassFirst">확인</a>
                </li>
            </ul>
            </form>
            <p class="sub">
                비밀번호는 공백없이 영문,숫자,특수문자를 혼합하여, 8~20자리 이내로 입력해주세요.
            </p>
        </div>
    </div>
    <div class="loginFt">
        <span class="loginBtmLogo"><img src="../img/common/bok_btm_logo.png" alt="한국은행CI"></span>
        <span class="loginBtmCp">Bank of Korea ⓒ 2021</span>
    </div>
</body>
<script src="/cbdc_js/loginMngPage.js"></script>
</html>
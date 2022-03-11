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
    <div class="loginBox">
        <div class="loginTop">
            <span class="bokLogo"></span>
            <h2>
                CBDC ADMIN
                <b>로그인</b>
            </h2>
        </div>
        <div class="loginBody">
            <ul>
                <li>
                    <input type="text" placeholder="아이디">
                </li>
                <li>
                    <input type="password" placeholder="비밀번호">
                </li>
                <li>
                    <a href="dashboard.html" class="loginBtn">확인</a>
                </li>
            </ul>
            <p>관리자에게 전달받은 계정정보를 이용해 로그인해주세요.</p>
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
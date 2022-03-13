<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
    <a href="/dashboard.do" class="cbdcLogo">
        CBDC ADMIN
    </a>
    <div class="userInfo">
        <p>
            IP : <span>${USER_INFO.ACCESS_IP }</span>    최근접속 : <span>${USER_INFO.ACCESS_DATE }</span>
        </p>
        <a href="#" class="userBox bok">
            <b>${USER_INFO.USER_NM }</b> 님
        </a>
        <div class="userList">
            <ul>
                <li><a href="mngUserPassword.html">비밀번호 변경</a></li>
                <li><a href="/login/loginOutProc.do">로그아웃</a></li>
            </ul>
        </div>
    </div>
</header>
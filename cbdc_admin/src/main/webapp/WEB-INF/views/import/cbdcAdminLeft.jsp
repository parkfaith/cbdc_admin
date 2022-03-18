<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="leftMenu">
    <nav>
        <ul>
            <li>
                <a id="nav-dash" href="/dashboardPage.do">대시보드</a>
            </li>
            <li class="sub">
                <a href="#">모니터링</a>
                <ul class="subMenu">
                    <li><a id="nav-mnt-node" href="/monitoring/nodeInfoPage.do">노드정보</a></li>
                    <li><a id="nav-mnt-block" href="/monitoring/blockInfoPage.do">블록정보</a></li>
                    <li><a id="nav-mnt-tx" href="/monitoring/txInfoPage.do">거래정보</a></li>
                </ul>
            </li>
            <li>
                <a id="nav-node-mng" href="/nodeMng/nodeMngPage.do">노드관리</a>
            </li>
            <li>
                <a id="nav-smt-cnrt" href="smartContMngList.html">스마트계약관리</a>
            </li>
            <li class="sub">
                <a href="#">시스템</a>
                <ul class="subMenu">
                    <li><a id="nav-mng-user" href="/systemMng/userMngPage.do">사용자관리</a></li>
                    <li><a id="nav-mng-menu" href="/systemMng/menuMngPage.do">메뉴관리</a></li>
                    <li><a id="nav-mng-auth" href="/systemMng/authMngPage.do">권한관리</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>
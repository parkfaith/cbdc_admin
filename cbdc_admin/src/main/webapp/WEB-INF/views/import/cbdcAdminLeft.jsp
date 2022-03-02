<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="leftMenu">
    <nav>
        <ul>
            <li>
                <a id="nav-dash" href="dashboard.html">대시보드</a>
            </li>
            <li class="sub">
                <a href="#">모니터링</a>
                <ul class="subMenu">
                    <li><a id="nav-mnt-node" href="mnNodeList.html">노드정보</a></li>
                    <li><a id="nav-mnt-block" href="mnBlockList.html">블록정보</a></li>
                    <li><a id="nav-mnt-tx" href="mnTxList.html">거래정보</a></li>
                </ul>
            </li>
            <li>
                <a id="nav-node-mng" href="nodeMngList.html">노드관리</a>
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
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
    	selectAuthName('${detailMap.userInfoMap.AUTH_CODE }');
    });
    </script>
</head>
<body>
    <div class="wrap">
        <c:import url="/WEB-INF/views/import/cbdcAdminTop.jsp" />
        <div class="content">
            <c:import url="/WEB-INF/views/import/cbdcAdminLeft.jsp" />
            <div class="mainContent nav-mng-user">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="contTop">
                            <h2>사용자 목록</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>시스템</dd>
                                    <dd>사용자관리</dd>
                                    <dd>사용자 상세</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="viewArea">
                            <div class="viewTbl">
                                <table>
                                    <colgroup>
                                        <col>
                                        <col width="36%">
                                        <col>
                                        <col width="36%">
                                    </colgroup>
                                    <tr>
                                        <th>아이디</th>
                                        <td>${detailMap.userInfoMap.USER_ID }</td>
                                        <th>이름</th>
                                        <td>${detailMap.userInfoMap.USER_NM }</td>
                                    </tr>
                                    <tr>
                                        <th>권한</th>
                                        <td colspan="3" id="authNameList">
                                            <span class="flag auth">관리자조회</span>
                                            <span class="flag auth">개발자</span>
                                            <span class="flag auth">승인/배포</span>
                                            <span class="flag auth">시스템관리</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>등록자</th>
                                        <td>${detailMap.userInfoMap.REG_NM }</td>
                                        <th>등록일</th>
                                        <td>${detailMap.userInfoMap.REG_DATE }</td>
                                    </tr>
                                    <tr>
                                        <th>수정자</th>
                                        <td>${detailMap.userInfoMap.UPD_NM }</td>
                                        <th>수정일</th>
                                        <td>${detailMap.userInfoMap.UPD_DATE }</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        
                        <div class="viewBtnArea">
                            <a href="userMngPage.do" class="button list">목록</a>
							<c:if test="${paramMap.btnCheck eq 'ACCEPT' }">
                            <a href="#" id="userUpdatePageBtn" class="button app">수정</a>
                            <a href="#" id="userDeleteBtn" class="button rej">삭제</a>
                            </c:if>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/systemMng/user/userDetailPage.js"></script>
<form name="userForm" id="userForm">
	<input type="hidden" name="saveType" id="saveType">
	<input type="hidden" name="detailType" id="detailType">
	<input type="hidden" name="userSeq" id="userSeq" value="${detailMap.userInfoMap.USER_SEQ }">
</form>
</html>
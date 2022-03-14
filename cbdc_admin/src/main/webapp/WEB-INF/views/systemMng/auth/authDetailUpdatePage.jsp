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
    <div class="wrap">
        <c:import url="/WEB-INF/views/import/cbdcAdminTop.jsp" />
        <div class="content">
            <c:import url="/WEB-INF/views/import/cbdcAdminLeft.jsp" />
            <div class="mainContent nav-mng-auth">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="contTop">
                            <h2>권한 상세</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>시스템</dd>
                                    <dd>권한관리</dd>
                                    <dd>권한 상세</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="viewArea">
                            <div class="viewTbl">
                            	<form name="authForm" id="authForm">
									<input type="hidden" name="saveType" id="saveType">
									<input type="hidden" name="detailType" id="detailType">
									<input type="hidden" name="authSeq" id="authSeq" value="${detailMap.AUTH_SEQ }">
                                <table>
                                    <colgroup>
                                        <col>
                                        <col width="36%">
                                        <col>
                                        <col width="36%">
                                    </colgroup>
                                    <tr>
                                        <th>권한코드</th>
                                        <td colspan="3">${detailMap.AUTH_CODE }</td>
                                    </tr>
                                    <tr>
                                        <th>권한명</th>
                                        <td colspan="3"><label class="w100per"><input type="text" id="authNm" value="${detailMap.AUTH_NM }"></label></td>
                                    </tr>
                                    <tr>
                                        <th>권한사용자</th>
                                        <td>${detailMap.AUTH_USERCNT }</td>
                                        <th>정렬순서</th>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <th>권한설명</th>
                                        <td colspan="3">
                                         	<label class="w100per">
                                                <textarea id="authDesc" name="authDesc">${detailMap.AUTH_DESC }</textarea>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>수정자</th>
                                        <td>${detailMap.UPD_NM }</td>
                                        <th>수정일</th>
                                        <td>${detailMap.UPD_DATE }</td>
                                    </tr>
                                </table>
                                </form>
                            </div>
                        </div>
                        
                        <div class="viewBtnArea">
                            <a href="/systemMng/authMngPage.do" class="button list">목록</a>
							
                            <a href="#" id="authUpdateBtn" class="button app">수정</a>
                            <a href="#" id="authCancelBtn" class="button rej">취소</a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/systemMng/auth/authDetailPage.js"></script>

</html>
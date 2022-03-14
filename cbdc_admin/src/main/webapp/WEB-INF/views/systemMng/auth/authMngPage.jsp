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
                            <h2>권한 목록</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>시스템</dd>
                                    <dd>권한관리</dd>
                                    <dd>권한 목록</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="searchArea">
                            <div class="searchBox">
                                <span>권한명</span>
                                <label class="text btnBox">
                                    <input type="text" placeholder="권한명 입력" id="searchWord">
                                    <a href="#none" id="btn_Search" class="searchBtn">검색</a>
                                </label>
                            </div>
                            <c:if test="${btnCheck eq 'ACCEPT' }">
                            <div class="btnArea">
                                <a href="#" class="button app" id="btnInput" name="btnInput">권한등록</a>
                            </div>
                            </c:if>
                        </div>
                        <div class="listBox">
                            <div class="listTop">
                                <div class="listCnt">
                                    전체 <span id="totalCnt">00</span> 건
                                </div>
                                <div class="listCntSel">
                                    <label>
                                        <select id="pageView" name="pageView">
                                            <option value="10">10개씩</option>
                                            <option value="20">20개씩</option>
                                            <option value="30">30개씩</option>
                                            <option value="50">50개씩</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            <div class="tblList">
                                <table>
                                    <colgroup>
                                        <col>
                                        <col>
                                        <col>
                                        <col width="20%">
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>권한코드</th>
                                            <th>권한명</th>
                                            <th>권한설명</th>
                                            <th>권한사용자</th>
                                            <!-- <th>정렬순서</th> -->
                                            <th>수정자</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                                    <tbody id="authList">
                                        
                                    </tbody>
                                </table>
                            </div>
                            <div class="paging" id="pagination"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/systemMng/auth/authMngPage.js"></script>
<form name="authForm" id="authForm">
	<input type="hidden" name="authSeq" id="authSeq">
	<input type="hidden" name="btnCheck" id="btnCheck" value="${btnCheck }">
</form>
</html>
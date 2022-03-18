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
            <div class="mainContent nav-node-mng">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="contTop">
                            <h2>노드 목록</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>노드관리</dd>
                                    <dd>노드관리 목록</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="searchArea">
                            <div class="searchBox">
                                <span>기관</span>
                                <label class="sel">
                                    <select id="searchOrg">
                                        <option value="">전체</option>
                                        <option value="BOK">한국은행</option>
                                        <option value="ETC">참가기관</option>
                                    </select>
                                </label>
                            </div>
                            <div class="searchBox">
                                <span>유형</span>
                                <label class="sel">
                                    <select id="searchNodeType">
                                        <option value="">전체</option>
                                        <option value="PN">PN</option>
                                        <option value="CN">CN</option>
                                        <option value="EN">EN</option>
                                    </select>
                                </label>
                            </div>
                            <div class="searchBox">
                                <span>검색어</span>
                                <label class="sel">
                                    <select id="searchType">
                                        <option value="SEARCHNM">이름</option>
                                        <option value="SEARCHIP">IP</option>
                                        <option value="SEARCHPORT1">PORT 1</option>
                                        <option value="SEARCHPORT2">PORT 2</option>
                                    </select>
                                </label>
                                <label class="text btnBox">
                                    <input type="text" id="searchWord" name="searchWord" placeholder="검색어 입력">
                                    <a href="#none" class="searchBtn" id="btn_Search">검색</a>
                                </label>
                            </div>
                            <div class="btnArea">
                                <c:if test="${btnCheck eq 'ACCEPT' }">
                                <a href="#" class="button app" id="btnInput" name="btnInput">노드추가</a>
                                </c:if>
                            </div>
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
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col style="width:220px;">
                                    </colgroup>
                                    <thead>
                                        <tr>
	                                        <th>No.</th>
	                                        <th>이름</th>
	                                        <th>기관</th>
	                                        <th>유형</th>
	                                        <th>IP</th>
	                                        <th>PORT 1</th>
	                                        <th>PORT 2</th>
	                                        <th>등록일</th>
	                                        <th>등록자</th>
                                        </tr>
                                    </thead>
                                    <tbody id="nodeList">
                                        
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
<script src="/cbdc_js/nodeMng/nodeMngPage.js"></script>
<form name="nodeForm" id="nodeForm">
	<input type="hidden" name="nodeSeq" id="nodeSeq">
	<input type="hidden" name="btnCheck" id="btnCheck" value="${btnCheck }">
</form>
</html>
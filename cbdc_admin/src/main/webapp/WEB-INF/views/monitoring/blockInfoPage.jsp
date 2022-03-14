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
            <div class="mainContent nav-mnt-block">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="contTop">
                            <h2>블록정보 목록</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>모니터링</dd>
                                    <dd>블록정보 목록</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="searchArea">
                            <div class="searchBox">
                                <span>상태</span>
                                <label class="sel">
                                    <select>
                                        <option value="">전체</option>
                                        <option value="">Active</option>
                                        <option value="">Inactive</option>
                                    </select>
                                </label>
                            </div>
                            <div class="searchBox">
                                <span>유형</span>
                                <label class="sel">
                                    <select>
                                        <option value="">전체</option>
                                        <option value="">PN</option>
                                        <option value="">CN</option>
                                        <option value="">LN</option>
                                    </select>
                                </label>
                            </div>
                            <div class="searchBox">
                                <span>검색어</span>
                                <label class="text btnBox">
                                    <input type="text" id="searchWord" name="searchWord" placeholder="노드이름 입력">
                                    <a href="#none" class="searchBtn" id="btn_Search">검색</a>
                                </label>
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
                                        <col style="width:220px">
                                        <col>
                                        <col style="width:220px">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>상태</th>
                                            <th>이름</th>
                                            <th>생성일시</th>
                                            <th>유형</th>
                                            <th>최신불록생성시간</th>
                                        </tr>
                                    </thead>
                                    <tbody id="nodeInfoList">
                                        
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
<script src="/cbdc_js/monitoring/blockInfoPage.js"></script>

</html>
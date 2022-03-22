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
    	//nodeList();	
    });
    </script>
</head>
<body>
    <div class="wrap">
        <c:import url="/WEB-INF/views/import/cbdcAdminTop.jsp" />
        <div class="content">
            <c:import url="/WEB-INF/views/import/cbdcAdminLeft.jsp" />
            <div class="mainContent nav-mnt-node">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="contTop">
                            <h2>노드정보 목록</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>모니터링</dd>
                                    <dd>노드정보 목록</dd>
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
                                <span>기관</span>
                                <label class="sel">
                                    <select>
                                        <option value="">전체</option>
                                        <option value="">한국은행</option>
                                        <option value="">참가기관</option>
                                    </select>
                                </label>
                            </div>
                            <div class="searchBox">
                                <span>유형</span>
                                <label class="sel">
                                    <select>
                                        <option value="">전체</option>
                                        <option value="">CN</option>
                                        <option value="">PN</option>
                                        <option value="">EN</option>
                                    </select>
                                </label>
                            </div>
                            <div class="searchBox">
                                <span>검색어</span>
                                <label class="text btnBox">
                                    <input type="text" placeholder="노드이름 입력">
                                    <a href="#" class="searchBtn">검색</a>
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
                                        <col>
                                        <col>
                                        <col style="width:220px">
                                        <col style="width:220px">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>상태</th>
                                            <th>이름</th>
                                            <th>기관</th>
                                            <th>유형</th>
                                            <th>Block Height</th>
                                            <th>등록일</th>
                                        </tr>
                                    </thead>
                                    <tbody id="nodeInfoList">
                                        <tr>
                                            <td class="num">000</td>
                                            <td class="sts">
                                                <span class="flag active">Active</span>
                                            </td>
                                            <td>
                                                <a href="/monitoring/nodeDetailPage.do">Node #1</a>
                                            </td>
                                            <td class="insti">한국은행</td>
                                            <td class="sts">
                                                <span class="node cn">CN</span>
                                            </td>
                                            <td class="date">000,000</td>
                                            <td class="date">2021-00-00 00:00:00</td>
                                        </tr>
                                        <tr>
                                            <td class="num">000</td>
                                            <td class="sts">
                                                <span class="flag active">Active</span>
                                            </td>
                                            <td>
                                                <a href="/monitoring/nodeDetailPage.do">Node #1</a>
                                            </td>
                                            <td class="insti">한국은행</td>
                                            <td class="sts">
                                                <span class="node pn">PN</span>
                                            </td>
                                            <td class="date">000,000</td>
                                            <td class="date">2021-00-00 00:00:00</td>
                                        </tr>
                                        <tr>
                                            <td class="num">000</td>
                                            <td class="sts">
                                                <span class="flag inactive">Inactive</span>
                                            </td>
                                            <td>
                                                <a href="/monitoring/nodeDetailPage.do">Node #1</a>
                                            </td>
                                            <td class="insti">한국은행</td>
                                            <td class="sts">
                                                <span class="node en">EN</span>
                                            </td>
                                            <td class="date">000,000</td>
                                            <td class="date">2021-00-00 00:00:00</td>
                                        </tr>
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
<script src="/cbdc_js/monitoring/nodeInfoPage.js"></script>
<form name="nodeForm" id="nodeForm">
	<input type="hidden" name="nodeId" id="nodeId">
</form>
</html>
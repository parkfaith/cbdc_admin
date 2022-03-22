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
    	//blockList();	
    }); 
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
                                <span>Block Height</span>
                                <label class="date">
                                    <input type="text">
                                    ~
                                    <input type="text">
                                </label>
                            </div>
                            <div class="searchBox">
                                <span>Timestamp</span>
                                <label class="date">
                                    <input type="text" class="datepickerSingle" placeholder="YY-MM-DD H:m:s">
                                    ~
                                    <input type="text" class="datepickerSingle" placeholder="YY-MM-DD H:m:s">
                                </label>
                            </div>
                            <div class="searchBox">
                                <label class="text btnBox">
                                    <a href="#" class="searchBtn">검색</a>
                                </label>
                            </div>
                        </div>
                        <div class="listBox">
                            <div class="listTop">
                                <div class="listCntSel">
                                    <span>최근</span>
                                    <label>
                                        <select>
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
                                        <col style="width:220px">
                                        <col style="width:220px">
                                        <col style="width:220px">
                                    </colgroup>
                                    <thead>
                                       <tr>
                                            <th>Block Height</th>
                                            <th>Timestamp</th>
                                            <th>Tx. Count</th>
                                            <th>Block Size</th>
                                        </tr>
                                    </thead>
                                    <tbody id="blockInfoList">
                                        <tr>
                                            <td>
                                                <a href="/monitoring/blockDetailPage.do">2,520,733</a>
                                            </td>
                                            <td class="date">2021-00-00 00:00:00</td>
                                            <td>1</td>
                                            <td>0</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="/monitoring/blockDetailPage.do">2,520,733</a>
                                            </td>
                                            <td class="date">2021-00-00 00:00:00</td>
                                            <td>1</td>
                                            <td>0</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="/monitoring/blockDetailPage.do">2,520,733</a>
                                            </td>
                                            <td class="date">2021-00-00 00:00:00</td>
                                            <td>1</td>
                                            <td>0</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/monitoring/blockInfoPage.js"></script>
<form name="blockForm" id="blockForm">
	<input type="hidden" name="blockId" id="blockId">
</form>
</html>
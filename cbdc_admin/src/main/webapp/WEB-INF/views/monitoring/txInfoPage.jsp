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
    	txList();	
    }); 
    </script>
</head>
<body>
    <div class="wrap">
        <c:import url="/WEB-INF/views/import/cbdcAdminTop.jsp" />
        <div class="content">
            <c:import url="/WEB-INF/views/import/cbdcAdminLeft.jsp" />
            <div class="mainContent nav-mnt-tx">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="contTop">
                            <h2>거래정보 목록</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>모니터링</dd>
                                    <dd>거래정보 목록</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="searchArea">
                            <div class="searchBox">
                                <span>Transaction Time</span>
                                <label class="date">
                                    <input type="text" class="datepickerSingle" placeholder="YY-MM-DD H:m:s">
                                    ~
                                    <input type="text" class="datepickerSingle" placeholder="YY-MM-DD H:m:s">
                                </label>
                            </div>
                            <div class="searchBox">
                                <span>From Address</span>
                                <label class="text">
                                    <input type="text" placeholder="From Address 입력">
                                </label>
                            </div>
                            <div class="searchBox">
                                <span>To Address</span>
                                <label class="text">
                                    <input type="text" placeholder="To Address 입력">
                                </label>
                            </div>
                            <div class="searchBox">
                                <span>Transaction Hash</span>
                                <label class="text btnBox ">
                                    <input type="text" placeholder="Transaction ID 입력">
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
                                        <col>
                                        <col style="width:320px">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>Transaction Hash</th>
                                            <th>Tx Receipt Status</th>
                                            <th>From Address</th>
                                            <th>To Address</th>
                                            <th>Value</th>
                                            <th>Nonce</th>
                                            <th>Timestamp</th>
                                        </tr>
                                    </thead>
                                    <tbody id="txInfoList">
                                        <tr>
                                            <td>
                                                <a href="mnTxView.html">TransactionIDTransactionIDTransactionIDTransactionID</a>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td><span class="hashCode">0x44d827f98430784c8e3401748d8ba92c43df4546</span></td>
                                            <td><span class="hashCode">0x44d827f98430784c8e3401748d8ba92c43df4546</span></td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td class="date">2021-00-00 00:00:00</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="mnTxView.html">TransactionIDTransactionIDTransactionIDTransactionID</a>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td class="date">2021-00-00 00:00:00</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="mnTxView.html">TransactionIDTransactionIDTransactionIDTransactionID</a>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td class="date">2021-00-00 00:00:00</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="paging" id="pagination">
                            	<a href="#" class="fst">처음</a>
                                <a href="#" class="prv">이전</a>

                                <a href="#">1</a>
                                <a href="#" class="current">2</a>
                                <a href="#">3</a>
                                <a href="#">4</a>
                                <a href="#">5</a>
                                <a href="#">6</a>
                                <a href="#">7</a>
                                <a href="#">8</a>
                                <a href="#">9</a>
                                <a href="#">10</a>

                                <a href="#" class="nxt">다음</a>
                                <a href="#" class="end">맨끝</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/monitoring/txInfoPage.js"></script>
<form name="txForm" id="txForm">
	<input type="hidden" name="txId" id="txId">
</form>
</html>
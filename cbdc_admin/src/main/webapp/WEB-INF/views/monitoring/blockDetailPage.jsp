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
    	//blockDetail('${blockId}');	
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
                            <h2>블록정보 상세</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>모니터링</dd>
                                    <dd>블록정보 상세</dd>
                                </dl>
                            </div>
                        </div>
                        
                        <div class="viewArea">
                            <div class="viewTbl" id="blockDetail">
                                 <table>
                                    <colgroup>
                                        <col>
                                        <col width="36%">
                                        <col>
                                        <col width="36%">
                                    </colgroup>
                                    <tr>
                                        <th>Block Height</th>
                                        <td>2,520,733</td>
                                        <th>Block Hash</th>
                                        <td>Dasf0923knfo293uflwkejo23ue</td>
                                    </tr>
                                    <tr>
                                        <th>Tx. Count</th>
                                        <td>1</td>
                                        <th>Block Size</th>
                                        <td>200 Byte</td>
                                    </tr>
                                    <tr>
                                        <th>Creation Node</th>
                                        <td>&nbsp;</td>
                                        <th>Timestamp</th>
                                        <td>2021-00-00 00:00:00</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                         <div class="viewArea">
                            <div class="viewTop">
                                <h2>TX List</h2>
                            </div>
                        </div>
                        <div class="listBox">
                            <div class="listTop">
                                <div class="listCnt">
                                    전체 <span>00</span> 건
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
                                        <col style="width:220px">
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
                                    <tbody>
                                        <!-- <tr>
                                            <td colspan="8" class="empty">결과가 없습니다.</td>
                                        </tr> -->
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
                        </div>
                        <div class="viewBtnArea">
                            <a href="/monitoring/blockInfoPage.do" class="button list">목록</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/monitoring/blockInfoPage.js"></script>

</html>
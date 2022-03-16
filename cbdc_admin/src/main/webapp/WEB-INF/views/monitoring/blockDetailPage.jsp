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
    	blockDetail('${blockId}');	
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
                                <div class="listCntSel">
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
                                        <col style="width:220px">
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>Creation Time</th>
                                            <th>Transaction ID</th>
                                            <th>Tx Receipt Status</th>
                                            <th>From Address</th>
                                            <th>To Address</th>
                                            <th>Value</th>
                                            <th>Nonce</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- <tr>
                                            <td colspan="8" class="empty">결과가 없습니다.</td>
                                        </tr> -->
                                        <tr>
                                            <td class="date">2021-00-00 00:00:00</td>
                                            <td>TransactionIDTransactionIDTransactionIDTransactionID</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="paging">
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
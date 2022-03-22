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
    	//nodeDetail('${nodeId}');	
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
                            <h2>노드정보 상세</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>모니터링</dd>
                                    <dd>노드정보 상세</dd>
                                </dl>
                            </div>
                        </div>
                        
                        <div class="viewArea">
                            <div class="viewTbl" id="nodeDetail">
                                <table>
                                    <colgroup>
                                        <col>
                                        <col width="36%">
                                        <col>
                                        <col width="36%">
                                    </colgroup>
                                    <tr>
                                        <th>상태</th>
                                        <td colspan="3">
                                            <span class="flag active">Active</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td>Node #1</td>
                                        <th>기관</th>
                                        <td>한국은행</td>
                                    </tr>
                                    <tr>
                                        <th>System Name</th>
                                        <td colspan="3">Klaytn/validator-1/vX.X.X/XXXX-XXXX/goX.X.X</td>
                                    </tr>
                                    <tr>
                                        <th>유형</th>
                                        <td>
                                            <span class="node cn">CN</span>
                                        </td>
                                        <th>Block Height</th>
                                        <td>00,000,000</td>
                                    </tr>
                                    <tr>
                                        <th>Public Key</th>
                                        <td colspan="3">
                                            <div class="chkAccount">
                                                <p id="walletAdd">C4234293uwdlfkslkdf02392lekjw</p>
                                                <a href="#" class="button" onclick="copyAdd('walletAdd'); return false;">copy</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>IP</th>
                                        <td>10.10.10.1</td>
                                        <th>체인 ID</th>
                                        <td>1002</td>
                                    </tr>
                                    <tr>
                                        <th>등록일</th>
                                        <td>2021-00-00 00:00:00</td>
                                        <th>등록자</th>
                                        <td>홍길동</td>
                                    </tr>
                                    <tr>
                                        <th>최종수정일시</th>
                                        <td colspan="3">2021-00-00 00:00:00</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="viewBtnArea">
                            <a href="/monitoring/nodeInfoPage.do" class="button list">목록</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/monitoring/nodeInfoPage.js"></script>

</html>
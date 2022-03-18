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
    	
    });
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
                            <h2>노드관리 상세</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>노드관리</dd>
                                    <dd>노드관리 상세</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="viewArea">
                            <div class="viewTbl">
                                <table>
                                    <colgroup>
                                        <col>
                                        <col width="36%">
                                        <col>
                                        <col width="36%">
                                    </colgroup>
                                    <tr>
                                        <th>이름</th>
                                        <td colspan="3">${detailMap.nodeInfoMap.NODE_NM }</td>
                                    </tr>
                                    <tr>
                                        <th>기관</th>
                                        <td>${detailMap.nodeInfoMap.NODE_ORG }</td>
                                        <th>유형</th>
                                        <td>
                                            <span class="node ${detailMap.nodeInfoMap.NODE_TYPE }">${detailMap.nodeInfoMap.NODE_TYPE }</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Public Key</th>
                                        <td colspan="3">
                                            <div class="chkAccount">
                                                <p id="walletAdd">${detailMap.nodeInfoMap.NODE_PUBKEY }</p>
                                                <a href="#" class="button" onclick="copyAdd('walletAdd'); return false;">copy</a>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th>IP</th>
                                        <td>
                                            ${detailMap.nodeInfoMap.NODE_IP }
                                        </td>
                                        <th>Prometheus Port</th>
                                        <td>${detailMap.nodeInfoMap.NODE_PROMETPORT }</td>
                                    </tr>
                                    <tr>
                                        <th>PORT 1</th>
                                        <td>${detailMap.nodeInfoMap.NODE_PORT1 }</td>
                                        <th>PORT 2</th>
                                        <td>${detailMap.nodeInfoMap.NODE_PORT2 }</td>
                                    </tr>
                                    <tr>
                                        <th>등록일</th>
                                        <td>${detailMap.nodeInfoMap.REG_DATE }</td>
                                        <th>등록자</th>
                                        <td>${detailMap.nodeInfoMap.REG_NM }</td>
                                    </tr>
                                    <tr>
                                        <th>최종수정일시</th>
                                        <td colspan="3">${detailMap.nodeInfoMap.UPD_DATE }</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        
                        <div class="viewBtnArea">
                            <a href="nodeMngPage.do" class="button list">목록</a>
							<c:if test="${paramMap.btnCheck eq 'ACCEPT' }">
                            <a href="#" id="nodeUpdatePageBtn" class="button app">수정</a>
                            <a href="#" id="nodeDeleteBtn" class="button rej">삭제</a>
                            </c:if>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/nodeMng/nodeDetailPage.js"></script>
<form name="nodeForm" id="nodeForm">
	<input type="hidden" name="saveType" id="saveType">
	<input type="hidden" name="detailType" id="detailType">
	<input type="hidden" name="btnCheck" id="btnCheck" value="${paramMap.btnCheck }">
	<input type="hidden" name="nodeSeq" id="nodeSeq" value="${detailMap.nodeInfoMap.NODE_SEQ }">
</form>
</html>
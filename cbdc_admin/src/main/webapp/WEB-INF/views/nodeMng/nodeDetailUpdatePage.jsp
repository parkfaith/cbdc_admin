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
                            	<form name="nodeForm" id="nodeForm">
                            		<input type="hidden" name="saveType" id="saveType">
                            		<input type="hidden" name="detailType" id="detailType">
                            		<input type="hidden" name="btnCheck" id="btnCheck" value="${paramMap.btnCheck }">
									<input type="hidden" name="nodeSeq" id="nodeSeq" value="${detailMap.nodeInfoMap.NODE_SEQ }">
                                <table>
                                    <colgroup>
                                        <col>
                                        <col width="36%">
                                        <col>
                                        <col width="36%">
                                    </colgroup>
                                    <tr>
                                        <th class="req">이름</th>
                                        <td colspan="3">
                                        	<label class="w50per">
                                                <input type="text" class="w100per" placeholder="이름 입력" id="nodeNm" name="nodeNm" value="${detailMap.nodeInfoMap.NODE_NM }">
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="req">기관</th>
                                        <td>
                                        	<label>
											<select id="nodeOrg" name="nodeOrg">
												<option value="bok" <c:if test="${detailMap.nodeInfoMap.NODE_ORG eq 'bok' }">selected</c:if>>한국은행</option>
												<option value="etc" <c:if test="${detailMap.nodeInfoMap.NODE_ORG eq 'etc' }">selected</c:if>>참가기관</option>
											</select>
											</label>
                                        </td>
                                        <th class="req">유형</th>
                                        <td>
                                        	<label>
                                            <select id="nodeType" name="nodeType">
                                                <option value="CN" <c:if test="${detailMap.nodeInfoMap.NODE_TYPE eq 'CN' }">selected</c:if>>CN</option>
                                                <option value="PN" <c:if test="${detailMap.nodeInfoMap.NODE_TYPE eq 'PN' }">selected</c:if>>PN</option>
                                                <option value="EN" <c:if test="${detailMap.nodeInfoMap.NODE_TYPE eq 'EN' }">selected</c:if>>EN</option>
                                            </select>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="req">Pub Key</th>
                                        <td colspan="3">
                                            <label class="w100per">
                                                <input type="text" class="w100per" placeholder="Pub Key 입력" id="nodePubkey" name="nodePubkey" value="${detailMap.nodeInfoMap.NODE_PUBKEY }">
                                            </label>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th class="req">IP</th>
                                        <td>
                                        	<label class="w60per">
                                                <input type="text" class="w100per" placeholder="IP 입력" id="nodeIp" name="nodeIp" value="${detailMap.nodeInfoMap.NODE_IP }">
                                            </label>
                                        </td>
                                        <th class="req">Prometheus Port</th>
                                        <td>
                                        	<label class="w40per">
                                                <input type="text" class="w100per" placeholder="Prometheus Port" id="nodePrometport" name="nodePrometport" value="${detailMap.nodeInfoMap.NODE_PROMETPORT }">
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="req">Port 1</th>
                                        <td>
                                        	<label class="w40per">
                                                <input type="text" class="w100per" placeholder="Port 1" id="nodePort1" name="nodePort1" value="${detailMap.nodeInfoMap.NODE_PORT1 }">
                                            </label>
                                        </td>
                                        <th class="req">Port 2</th>
                                        <td>
                                        	<label class="w40per">
                                                <input type="text" class="w100per" placeholder="Port 2" id="nodePort2" name="nodePort2" value="${detailMap.nodeInfoMap.NODE_PORT2 }">
                                            </label>
                                        </td>
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
                                </form>
                            </div>
                        </div>
                        
                        <div class="viewBtnArea">
                            <a href="nodeMngPage.do" class="button list">목록</a>
                            <a href="#" id="nodeUpdateBtn" class="button app">수정</a>
                            <a href="#" id="nodeCancelBtn" class="button rej">취소</a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/nodeMng/nodeDetailPage.js"></script>

</html>
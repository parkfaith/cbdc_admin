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
                            <h2>노드관리 목록</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="/">home</a></dd>
                                    <dd>노드관리</dd>
                                    <dd>노드관리 등록</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="viewArea">
                            <div class="viewTbl">
                            	<form name="nodeForm" id="nodeForm">
                            	<input type="hidden" name="saveType" id="saveType">
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
                                                <input type="text" class="w100per" placeholder="이름 입력" id="nodeNm" name="nodeNm">
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="req">유형</th>
                                        <td>
                                            <label>
                                                <select id="nodeType" name="nodeType">
                                                    <option value="CN">CN</option>
                                                    <option value="PN">PN</option>
                                                    <option value="EN">EN</option>
                                                </select>
                                            </label>
                                        </td>
                                        <th class="req">기관</th>
                                        <td>
                                            <label>
                                                <select id="nodeOrg" name="nodeOrg">
                                                    <option value="bok">한국은행</option>
                                                    <option value="etc">참가기관</option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="req">Pub Key</th>
                                        <td colspan="3">
                                            <label class="w100per">
                                                <input type="text" class="w100per" placeholder="Pub Key 입력" id="nodePubKey" name="nodePubKey">
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="req">IP</th>
                                        <td>
                                            <label class="w60per">
                                                <input type="text" class="w100per" placeholder="IP 입력" id="nodeIp" name="nodeIp">
                                            </label>
                                        </td>
                                        <th class="req">Prometheus Port</th>
                                        <td>
                                            <label class="w40per">
                                                <input type="text" class="w100per" placeholder="Prometheus Port" id="nodePrometPort">
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="req">Port 1</th>
                                        <td>
                                            <label class="w40per">
                                                <input type="text" class="w100per" placeholder="Port 1" id="nodePort1" name="nodePort1">
                                            </label>
                                        </td>
                                        <th class="req">Port 2</th>
                                        <td>
                                            <label class="w40per">
                                                <input type="text" class="w100per" placeholder="Port 2" id="nodePort2" name="nodePort2">
                                            </label>
                                        </td>
                                    </tr>
                                </table>
                                </form>
                            </div>
                        </div>
                        
                        <div class="viewBtnArea">
                            <a href="nodeMngPage.do" class="button list">목록</a>

                            <a href="#" class="button app" id="nodeInsert">등록</a>
                            <a href="nodeMngPage.do" class="button close">취소</a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/nodeMng/nodeInputPage.js"></script>
</html>
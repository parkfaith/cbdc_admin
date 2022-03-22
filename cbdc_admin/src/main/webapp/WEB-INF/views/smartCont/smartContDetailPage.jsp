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
    $(window).ready(function(){
        loading();
        setTimeout(function(){
            hideLoading();
            $(".mainDashboard").css('opacity','1');
        },1000);
   })
    </script>
</head>
<body>
    <div class="wrap">
       <c:import url="/WEB-INF/views/import/cbdcAdminTop.jsp" />
        <div class="content">
            <c:import url="/WEB-INF/views/import/cbdcAdminLeft.jsp" />
            <div class="mainContent nav-smt-cnrt">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="contTop">
                            <h2>스마트계약관리 상세</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>스마트계약관리</dd>
                                    <dd>스마트계약관리 상세</dd>
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
                                        <th>상태</th>
                                        <td colspan="3">
                                        <c:if test="${selectDetail.SMART_STATUS == '등록'}">
                                            <span class="flag">
                                        </c:if>
                                        <c:if test="${selectDetail.SMART_STATUS == '점검완료'}">
                                            <span class="flag app">
                                        </c:if>
                                        <c:if test="${selectDetail.SMART_STATUS == '승인'}">
                                            <span class="flag com">
                                        </c:if>
                                        <c:if test="${selectDetail.SMART_STATUS == '반려'}">
                                            <span class="flag rej">
                                        </c:if>
                                            ${selectDetail.SMART_STATUS}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>계약명</th>
                                        <td colspan="3">
                                            ${selectDetail.SMART_CONTNM}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>계약설명</th>
                                        <td colspan="3">
                                            ${selectDetail.SMART_CONTDESC}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>배포자 주소</th>
                                        <td colspan="3">
                                            <div class="chkAccount">
                                                <p id="walletAdd">${selectDetail.SMART_FROMADDR}</p>
                                                <a href="#" class="button" onclick="copyAdd('walletAdd'); return false;">copy</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>버전</th>
                                        <td>${selectDetail.SMART_VER}</td>
                                        <th>계약 ID</th>
                                        <td>${selectDetail.SMART_CONTID}</td>
                                    </tr>
                                    <tr>
                                        <th>생성일시</th>
                                        <td>${selectDetail.REG_DATE}</td>
                                        <th>최종변경일시</th>
                                        <td>${selectDetail.UPD_DATE}</td>
                                    </tr>
                                    <tr>
                                        <th>처리자</th>
                                        <td colspan="3">${selectDetail.REG_ID}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        
                        <div class="viewArea">
                            <div class="viewTop">
                                <h2>소스코드</h2>
                            </div>
                            <div class="codeEditor">
                                <textarea class="codeEditorArea" id="editor1" name="editor1">${selectDetail.SMART_SOURCE}</textarea>
                            </div>
                        </div>

                        <div class="viewArea">
                            <div class="viewTop">
                                <h2>ABI</h2>
                            </div>
                            <div class="codeEditor">
                                <textarea class="codeEditorArea" id="editor2" name="editor2">${selectDetail.SMART_ABI}</textarea>
                            </div>
                        </div>

                        <div class="viewArea">
                            <div class="viewTop">
                                <h2>Byte Code</h2>
                            </div>
                            <div class="codeEditor">
                                <textarea class="codeEditorArea" id="editor3" name="editor3">${selectDetail.SMART_BYTECODE}</textarea>
                            </div>
                        </div>

                        <div class="viewBtnArea">
                            <a href="/smartCont/smartContMngPage.do" class="button list">목록</a>
                            
                            <a href="#" class="button" id="updateCont">수정</a>
                            <a href="#" class="button rej" id="deleteCont">삭제</a>

                            <a href="#" class="button app" id="codeChk">코드점검</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
<link rel="stylesheet" href="../css/codemirror.css">
<script src="../js/codemirror/codemirror.js"></script>
<script src="../js/codemirror/matchbrackets.js"></script>
<script src="../js/codemirror/python.js"></script>
<script src="/cbdc_js/smartCont/smartContDetail.js"></script>
<form name="contForm" id="contForm">
	<input type="hidden" name="contSeq" id="contSeq" value="${selectDetail.SMART_SEQ}">
	<input type="hidden" name="type" id="type">
	<input type="hidden" name="saveType" id="saveType">
</form>
</html>
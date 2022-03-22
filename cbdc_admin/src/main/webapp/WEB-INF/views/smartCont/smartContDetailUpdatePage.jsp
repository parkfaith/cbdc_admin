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
                            <h2>스마트계약관리 등록</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>스마트계약관리</dd>
                                    <dd>스마트계약관리 등록</dd>
                                </dl>
                            </div>
                        </div>
						<form name="updateForm" id="updateForm">
							<input type="hidden" name="contSeq" id="contSeq" value="${selectDetail.SMART_SEQ}">
							<input type="hidden" name="saveType" id="saveType">
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
                                        <th class="req">계약명</th>
                                        <td colspan="3">
                                            <label class="w100per">
                                                <input type="text" class="w100per" name="contNm" id="contNm" value="${selectDetail.SMART_CONTNM}" placeholder="이름 입력">
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="req">계약설명</th>
                                        <td colspan="3">
                                            <textarea name="contDesc" id="contDesc" placeholder="계약설명 입력">${selectDetail.SMART_CONTDESC}</textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="req">배포자 주소</th>
                                        <td colspan="3">
                                            <label class="w100per">
                                                <input type="text" class="w100per" name="fromAddr" id="fromAddr" value="${selectDetail.SMART_FROMADDR}" placeholder="배포자 주소 입력">
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="req">버전</th>
                                        <td>
                                            <label>
                                                <input type="text" name="ver" id="ver" value="${selectDetail.SMART_VER}" placeholder="버전 입력">
                                            </label>
                                        </td>
                                        <th class="req">계약 ID</th>
                                        <td>
                                            <label>
                                                <input type="text" name="contId" id="contId" value="${selectDetail.SMART_CONTID}" placeholder="계약 ID 입력">
                                            </label>
                                        </td>
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
                        </form>
                        
                        <div class="viewBtnArea">
                            <a href="#" class="button app" id="updateCont">수정</a>
                            <a href="/smartCont/smartContMngPage.do" class="button close">취소</a>
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
<script src="/cbdc_js/smartCont/smartContUpdateDetail.js"></script>
</html>
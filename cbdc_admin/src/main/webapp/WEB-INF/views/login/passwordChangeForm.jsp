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
            <div class="mainContent">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="contTop">
                            <h2>비밀번호 변경</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>비밀번호 변경</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="viewArea">
                            <div class="viewTbl">
                                <table>
                                    <colgroup>
                                        <col>
                                        <col>
                                    </colgroup>
                                    <tr>
                                        <th class="req">현재 비밀번호</th>
                                        <td>
                                            <label class="w40per">
                                                <input type="password" class="w100per" placeholder="현재 비밀번호를 입력해주세요." id="currentPass">
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="req">새 비밀번호</th>
                                        <td>
                                            <label class="w40per">
                                                <input type="password" class="w100per" placeholder="새 비밀번호를 입력해주세요." id="newPass">
                                            </label>
                                            <p class="info dipnone" id="passInfo">비밀번호는 공백없이 영문,숫자,특수문자를 혼합하여, 8~20자리 이내로 입력해주세요.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="req">비밀번호 확인</th>
                                        <td>
                                            <label class="w40per">
                                                <input type="password" class="w100per" placeholder="비밀번호를 한번 더 입력해주세요." id="chkPass">
                                            </label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        
                        <div class="viewBtnArea">
                            <a href="#" class="button app" id="savePass">저장</a>
                            <a href="#" class="button close" id="cancelPass">취소</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/loginMngPage.js"></script>
</html>
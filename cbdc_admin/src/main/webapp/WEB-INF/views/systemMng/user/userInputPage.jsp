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
            <div class="mainContent nav-mng-user">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="contTop">
                            <h2>사용자 목록</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>시스템</dd>
                                    <dd>사용자관리</dd>
                                    <dd>사용자 등록</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="viewArea">
                            <div class="viewTbl">
                            	<form name="userForm" id="userForm">
                            	<input type="hidden" name="saveType" id="saveType">
                                <table>
                                    <colgroup>
                                        <col>
                                        <col width="36%">
                                        <col>
                                        <col width="36%">
                                    </colgroup>
                                    <tr>
                                        <th class="req">아이디</th>
                                        <td>
                                            <label class="text btnBox idChk">
                                                <input type="text" id="userId" placeholder="아이디 입력">
                                                <a href="#" class="searchBtn idChk" id="idChkBtn">중복확인</a>
                                            </label>
                                        </td>
                                        <th class="req">이름</th>
                                        <td>
                                            <label>
                                                <input type="text" id="userNm" placeholder="실명 입력">
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>권한</th>
                                        <td colspan="3">*권한은 사용자 등록 후 권한관리에서 등록/수정 할 수 있습니다.</td>
                                    </tr>
                                </table>
                                </form>
                            </div>
                        </div>
                        
                        <div class="viewBtnArea">
                            <a href="userMngPage.do" class="button list">목록</a>

                            <a href="#" class="button app" id="userInsert">등록</a>
                            <a href="userMngPage.do" class="button close">취소</a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/systemMng/user/userInputPage.js"></script>
</html>
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
            <div class="mainContent nav-mng-auth">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="contTop">
                            <h2>권한 등록</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>시스템</dd>
                                    <dd>권한관리</dd>
                                    <dd>권한 등록</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="viewArea">
                            <div class="viewTbl">
                            	<form name="authForm" id="authForm">
                            	<input type="hidden" name="saveType" id="saveType">
                                <table>
                                    <colgroup>
                                        <col>
                                        <col width="56%">
                                        <col>
                                        <col width="16%">
                                    </colgroup>
                                    <tr>
                                        <th>권한명</th>
                                        <td>
                                            <label class="w100per">
                                                <input type="text" class="w100per" id="authNm" name="authNm" placeholder="권한명">
                                            </label>
                                        </td>
                                        <th>정렬순서</th>
                                        <td>
                                            <label class="w100per">
                                                <input type="text" class="w100per" id="authOrderNo" name="authOrderNo" placeholder="정렬순서" value="13">
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>권한설명</th>
                                        <td colspan="3">
                                            <label class="w100per">
                                                <textarea id="authDesc" name="authDesc"></textarea>
                                            </label>
                                        </td>
                                    </tr>
                                </table>
                                </form>
                            </div>
                        </div>
                        
                        <div class="viewBtnArea">
                            <a href="/systemMng/authMngPage.do" class="button list">목록</a>

                            <a href="#" class="button app" id="authInsert">등록</a>
                            <a href="/systemMng/authMngPage.do" class="button close">취소</a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/systemMng/authManage.js"></script>
</html>
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
        //JSLists.applyToList('menuTreeList', 'ALL', 'openAll');

        $(document).on('click','a.menuItem',function(){
            $(".menuMngTreeInner ul li a.menuItem").removeClass('selected');
            $(this).addClass('selected');
            return false;
        });
	});
    </script>
</head>
<body>
    <div class="wrap">
        <c:import url="/WEB-INF/views/import/cbdcAdminTop.jsp" />
        <div class="content">
            <c:import url="/WEB-INF/views/import/cbdcAdminLeft.jsp" />
            <div class="mainContent nav-mng-menu">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="contTop">
                            <h2>메뉴관리</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>시스템</dd>
                                    <dd>메뉴관리</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="menuMngArea">
                            <div class="menuList">
                                <div class="menuInnerBox">
                                    <div class="viewArea">
                                        <div class="viewTop">
                                            <h2>시스템 메뉴</h2>
                                        </div>
                                    </div>
                                    <div class="menuTreeBox">
                                        <ul id="menuTreeList">
										    
                                            <!-- <li><a href="#" class="menuItem depth1">CBDC Admin</a><ul><li><a href="#" class="menuItem depth2">대시보드</a></li><li><a href="#" class="menuItem depth2">모니터링</a><ul><li><a href="#" class="menuItem depth3">노드정보</a></li><li><a href="#" class="menuItem depth3">블록정보</a></li><li><a href="#" class="menuItem depth3">거래정보</a></li></ul></li><li><a href="#" class="menuItem depth2">노드관리</a></li><li><a href="#" class="menuItem depth2">스마트계약관리</a></li><li><a href="#" class="menuItem depth2">시스템관리</a><ul><li><a href="#" class="menuItem depth3">사용자관리</a></li><li><a href="#" class="menuItem depth3">메뉴관리</a></li><li><a href="#" class="menuItem depth3">권한관리</a></li></ul></li></ul></li> -->
                                        </ul>
                                    </div>
                                    <div class="viewBtnArea tal">
                                        <a href="#" class="button app">하위메뉴 추가</a>
                                        <a href="#" class="button up">위로</a>
                                        <a href="#" class="button down">아래로</a>
                                    </div>
                                </div>
                            </div>
                            <div class="menuList mod">
                                <div class="menuInnerBox">
                                    <div class="viewArea">
                                        <div class="viewTop">
                                            <h2>메뉴정보</h2>
                                        </div>
                                        <div class="viewTbl">
                                            <table>
                                                <colgroup>
                                                    <col>
                                                    <col width="36%">
                                                    <col>
                                                    <col width="36%">
                                                </colgroup>
                                                <tr>
                                                    <th>메뉴명</th>
                                                    <td colspan="3">
                                                        <label class="w100per">
                                                            <input type="text" class="w100per" placeholder="메뉴명" id="menuNm">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>상위메뉴</th>
                                                    <td colspan="3">
                                                        <label class="w100per">
                                                            <select class="w100per mx-w800px" id="upperMenu">
                                                                <option>모니터링</option>
                                                            </select>
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>메뉴경로</th>
                                                    <td colspan="3">
                                                        <label class="w100per">
                                                            <input type="text" class="w100per" placeholder="URL" id="menuUrl">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>메뉴설명</th>
                                                    <td colspan="3">
                                                        <label class="w100per">
                                                            <textarea id="menuDesc"></textarea>
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>등록자</th>
                                                    <td id="regId">홍길동</td>
                                                    <th>등록일</th>
                                                    <td id="regDate">2021-00-00 00:00:00</td>
                                                </tr>
                                                <tr>
                                                    <th>수정자</th>
                                                    <td id="updId">홍길동</td>
                                                    <th>수정일</th>
                                                    <td id="updDate">2021-00-00 00:00:00</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    
                                    <div class="viewArea menuAuth">
                                        <div class="viewTop">
                                            <h2>권한정보</h2>
                                        </div>

                                        <div class="listBox">
                                            <div class="tblList">
                                                <table id="authList">
                                                    <colgroup>
                                                        <col>
                                                        <col>
                                                        <col>
                                                        <col>
                                                        <col>
                                                        <col>
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <label>
                                                                    <input type="checkbox" class="chkAll">
                                                                </label>
                                                            </th>
                                                            <th>권한코드</th>
                                                            <th>권한명</th>
                                                            <th>권한설명</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td class="num">
                                                                <label>
                                                                    <input type="checkbox" class="authChk">
                                                                </label>
                                                            </td>
                                                            <td class="auth">authCode</td>
                                                            <td class="auth">관리자조회</td>
                                                            <td class="insti">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="num">
                                                                <label>
                                                                    <input type="checkbox" class="authChk">
                                                                </label>
                                                            </td>
                                                            <td class="auth">authCode</td>
                                                            <td class="auth">개발자</td>
                                                            <td class="insti">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="num">
                                                                <label>
                                                                    <input type="checkbox" class="authChk">
                                                                </label>
                                                            </td>
                                                            <td class="auth">authCode</td>
                                                            <td class="auth">승인배포</td>
                                                            <td class="insti">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="num">
                                                                <label>
                                                                    <input type="checkbox" class="authChk">
                                                                </label>
                                                            </td>
                                                            <td class="auth">authCode</td>
                                                            <td class="auth">시스템관리</td>
                                                            <td class="insti">&nbsp;</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="viewBtnArea">
                                        <a href="#" class="button app">수정</a>
                                        <a href="#" class="button rej">삭제</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/systemMng/menu/menuMngPage.js"></script>
<form name="menuForm" id="menuForm">
	<input type="hidden" name="menuSeq" id="menuSeq">
</form>
</html>
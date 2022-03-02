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
                            <h2>권한 상세</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>시스템</dd>
                                    <dd>권한관리</dd>
                                    <dd>권한 상세</dd>
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
                                        <th>권한코드</th>
                                        <td colspan="3">${detailMap.AUTH_CODE }</td>
                                    </tr>
                                    <tr>
                                        <th>권한명</th>
                                        <td colspan="3">${detailMap.AUTH_NM }</td>
                                    </tr>
                                    <tr>
                                        <th>권한사용자</th>
                                        <td>${detailMap.AUTH_USERCNT }</td>
                                        <th>정렬순서</th>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <th>권한설명</th>
                                        <td colspan="3">${detailMap.AUTH_DESC }</td>
                                    </tr>
                                    <tr>
                                        <th>수정자</th>
                                        <td>${detailMap.UPD_NM }</td>
                                        <th>수정일</th>
                                        <td>${detailMap.UPD_DATE }</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        
                        <div class="viewBtnArea">
                            <a href="/systemMng/authMngPage.do" class="button list">목록</a>

                            <a href="#" id="authUpdatePageBtn" class="button app">수정</a>
                            <a href="#" id="authDeleteBtn" class="button rej">삭제</a>
                        </div>
                        
                        <div class="viewArea">
                            <div class="viewTop">
                                <h2>권한사용자 목록</h2>
                            </div>
                        </div>

                        <div class="searchArea">
                            <div class="searchBox">
                                <span>검색어</span>
                                <label class="sel">
                                    <select>
                                        <option value="">아이디</option>
                                        <option value="">이름</option>
                                    </select>
                                </label>
                                <label class="text btnBox">
                                    <input type="text" placeholder="검색어 입력">
                                    <a href="#" class="searchBtn">검색</a>
                                </label>
                            </div>
                            <div class="btnArea">
                                <a href="#" class="button app" id="addAuth">추가</a>
                                <a href="#" class="button rej" id="delAuth">삭제</a>
                            </div>
                        </div>

                        <div class="listBox">
                            <div class="listTop">
                                <div class="listCnt">
                                    전체 <span>00</span> 건
                                </div>
                                <div class="listCntSel">
                                    <label>
                                        <select>
                                            <option value="10">10개씩</option>
                                            <option value="20">20개씩</option>
                                            <option value="30">30개씩</option>
                                            <option value="50">50개씩</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
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
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>등록일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- <tr>
                                            <td colspan="6" class="empty">결과가 없습니다.</td>
                                        </tr> -->
                                        <tr>
                                            <td class="num">
                                                <label>
                                                    <input type="checkbox" class="authChk">
                                                </label>
                                            </td>
                                            <td class="user">bokuser1</td>
                                            <td class="insti">홍길동</td>
                                            <td class="date">2021-00-00</td>
                                        </tr>
                                        <tr>
                                            <td class="num">
                                                <label>
                                                    <input type="checkbox" class="authChk">
                                                </label>
                                            </td>
                                            <td class="user">bokuser1</td>
                                            <td class="insti">홍길동</td>
                                            <td class="date">2021-00-00</td>
                                        </tr>
                                        <tr>
                                            <td class="num">
                                                <label>
                                                    <input type="checkbox" class="authChk">
                                                </label>
                                            </td>
                                            <td class="user">bokuser1</td>
                                            <td class="insti">홍길동</td>
                                            <td class="date">2021-00-00</td>
                                        </tr>
                                        <tr>
                                            <td class="num">
                                                <label>
                                                    <input type="checkbox" class="authChk">
                                                </label>
                                            </td>
                                            <td class="user">bokuser1</td>
                                            <td class="insti">홍길동</td>
                                            <td class="date">2021-00-00</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="paging">
                                <a href="#" class="fst">처음</a>
                                <a href="#" class="prv">이전</a>

                                <a href="#">1</a>
                                <a href="#" class="current">2</a>
                                <a href="#">3</a>
                                <a href="#">4</a>
                                <a href="#">5</a>
                                <a href="#">6</a>
                                <a href="#">7</a>
                                <a href="#">8</a>
                                <a href="#">9</a>
                                <a href="#">10</a>

                                <a href="#" class="nxt">다음</a>
                                <a href="#" class="end">맨끝</a>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/systemMng/authManage.js"></script>
<form name="authForm" id="authForm">
	<input type="hidden" name="saveType" id="saveType">
	<input type="hidden" name="detailType" id="detailType">
	<input type="hidden" name="authSeq" id="authSeq" value="${detailMap.AUTH_SEQ }">
</form>
</html>
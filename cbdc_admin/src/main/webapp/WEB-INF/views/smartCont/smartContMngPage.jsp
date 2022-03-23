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
                            <h2>스마트계약관리 목록</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>스마트계약관리</dd>
                                    <dd>스마트계약관리 목록</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="searchArea">
                            <div class="searchBox">
                                <span>상태</span>
                                <label class="sel">
                                    <select id="searchType">
                                        <option value="">전체</option>
                                        <option value="등록">등록</option>
                                        <option value="점검완료">점검완료</option>
                                        <option value="반려">반려</option>
                                        <option value="배포완료">배포완료</option>
                                    </select>
                                </label>
                            </div>
                            <div class="searchBox">
                                <span>검색어</span>
                                <label class="text btnBox">
                                    <input type="text" id="searchWord" placeholder="계약명 입력">
                                    <a href="#" class="searchBtn" id="searchBtn">검색</a>
                                </label>
                            </div>
                            
                            <div class="btnArea">
                                <a href="/smartCont/smartContReg.do" class="button app">등록</a>
                            </div>
                        </div>
                        <div class="listBox">
                            <div class="listTop">
                                <div class="listCnt">
                                    전체 <span id="totCnt"></span> 건
                                </div>
                                <div class="listCntSel">
                                    <label>
                                        <select id="perPage">
                                            <option value="10">10개씩</option>
                                            <option value="20">20개씩</option>
                                            <option value="30">30개씩</option>
                                            <option value="50">50개씩</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            <div class="tblList">
                                <table>
                                    <colgroup>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col style="width: 200px;">
                                        <col style="width: 200px;">
                                        <col>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>상태</th>
                                            <th>계약명</th>
                                            <th>계약ID</th>
                                            <th>버전</th>
                                            <th>생성일시</th>
                                            <th>최종수정일시</th>
                                            <th>처리자</th>
                                        </tr>
                                    </thead>
                                    <tbody id="contractList">
                                        <!-- <tr>
                                            <td colspan="8" class="empty">결과가 없습니다.</td>
                                        </tr> -->
                                        <!-- <tr>
                                            <td class="num">000</td>
                                            <td class="sts">
                                                <span class="flag">등록</span>
                                            </td>
                                            <td>
                                                <a href="smartContMngView.html">제조컨트랙트</a>
                                            </td>
                                            <td class="insti">Anfdslkfjwpojefsld12</td>
                                            <td class="insti">1.0</td>
                                            <td class="date">2022-00-00 00:00:00</td>
                                            <td class="date">2022-00-00 00:00:00</td>
                                            <td class="writer">홍길동</td>
                                        </tr>
                                        <tr>
                                            <td class="num">000</td>
                                            <td class="sts">
                                                <span class="flag app">점검완료</span>
                                            </td>
                                            <td>
                                                <a href="smartContMngDeploy.html">제조컨트랙트</a>
                                            </td>
                                            <td class="insti">Anfdslkfjwpojefsld12</td>
                                            <td class="insti">1.0</td>
                                            <td class="date">2022-00-00 00:00:00</td>
                                            <td class="date">2022-00-00 00:00:00</td>
                                            <td class="writer">홍길동</td>
                                        </tr>                                        
                                        <tr>
                                            <td class="num">000</td>
                                            <td class="sts">
                                                <span class="flag com">배포완료</span>
                                            </td>
                                            <td>
                                                <a href="smartContMngView.html">제조컨트랙트</a>
                                            </td>
                                            <td class="insti">Anfdslkfjwpojefsld12</td>
                                            <td class="insti">1.0</td>
                                            <td class="date">2022-00-00 00:00:00</td>
                                            <td class="date">2022-00-00 00:00:00</td>
                                            <td class="writer">홍길동</td>
                                        </tr>
                                        <tr>
                                            <td class="num">000</td>
                                            <td class="sts">
                                                <span class="flag rej">반려</span>
                                            </td>
                                            <td>
                                                <a href="smartContMngView.html">제조컨트랙트</a>
                                            </td>
                                            <td class="insti">Anfdslkfjwpojefsld12</td>
                                            <td class="insti">1.0</td>
                                            <td class="date">2022-00-00 00:00:00</td>
                                            <td class="date">2022-00-00 00:00:00</td>
                                            <td class="writer">홍길동</td>
                                        </tr> -->
                                    </tbody>
                                </table>
                            </div>
                            <div class="paging" id="paging">
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
<script src="/cbdc_js/smartCont/smartContMngPage.js"></script>
<form name="contForm" id="contForm">
	<input type="hidden" name="contSeq" id="contSeq">
	<input type="hidden" name="type" id="type">
</form>
</html>
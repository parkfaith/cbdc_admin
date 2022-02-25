<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>한국은행 | CBDC 관리시스템</title>

    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/res.css">

    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/common.js"></script>
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
                            <h2>사용자 목록</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>시스템</dd>
                                    <dd>사용자관리</dd>
                                    <dd>사용자 목록</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="searchArea">
                        	<form name="form_search" id="form_search">
                            <div class="searchBox">
                                <span>기간검색</span>
                                <label class="date">
                                    <input type="date" id="search_sDate">
                                    ~
                                    <input type="date" id="search_eDate">
                                </label>
                            </div>
                            <div class="searchBox">
                                <span>검색어</span>
                                <label class="sel">
                                    <select id="search_type">
                                        <option value="user_id">아이디</option>
                                        <option value="user_nm">이름</option>
                                        <option value="reg_id">등록자</option>
                                    </select>
                                </label>
                                <label class="text btnBox">
                                    <input type="text" id="search_keyword" name="search_keyword" placeholder="검색어 입력">
                                    <a href="#none" class="searchBtn" id="btn_Search">검색</a>
                                </label>
                            </div>
                            </form>
                            <div class="btnArea">
                                <a href="mngUserReg.html" class="button app">사용자등록</a>
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
                                <table>
                                    <colgroup>
                                        <col>
                                        <col>
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
                                                <a href="#" class="sort">No.</a>
                                            </th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>권한</th>
                                            <th>등록자</th>
                                            <th>
                                                <a href="#" class="sort">등록일</a>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="person_list">
                                        
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
<script src="../cbdc_js/personManage.js"></script>
</html>
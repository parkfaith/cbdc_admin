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
    $(document).ready(function() {
    	authUserList(1);
    	
    	//전체 체크
        $(".chkAll").click(function(){
            var $chkArea = $(this).closest('table');
            if($(this).is(":checked") == true) {
                $chkArea.find('.authChk').prop("checked", true);
            }else{
                $chkArea.find('.authChk').prop("checked", false);
            }
        });

        //팝업생성
        $("#addAuth").click(function(){
            openModal('authMemModal');
            authUserListPop(1);
            return false;
        });
    });
    
    //팝업닫기 - 초기화
    function closeAuthModal(){
        closeModal('authMemModal');
        $("#memModalSel option:eq(0)").prop("selected", true);
        $("#searchWordpop").val('');
        $('#memModalList').find("input[type='checkbox']").prop("checked", false);
    }
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
                                        <td>${detailMap.AUTH_NM }</td>
                                        <th>권한사용자</th>
                                        <td id="checkAuthUserCnt">${detailMap.AUTH_USERCNT }</td>
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
							<c:if test="${paramMap.btnCheck eq 'ACCEPT' }">
                            <a href="#" id="authUpdatePageBtn" class="button app">수정</a>
                            <a href="#" id="authDeleteBtn" class="button rej">삭제</a>
                            </c:if>
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
                                    <select id="searchType">
                                        <option value="USERID">아이디</option>
                                        <option value="USERNM">이름</option>
                                    </select>
                                </label>
                                <label class="text btnBox">
                                    <input type="text" placeholder="검색어 입력" id="searchWord" name="searchWord">
                                    <a href="#" class="searchBtn" id="btn_userSearch">검색</a>
                                </label>
                            </div>
                            <c:if test="${paramMap.btnCheck eq 'ACCEPT' }">
                            <div class="btnArea">
                                <a href="#" class="button app" id="addAuth">추가</a>
                                <a href="#" class="button rej" id="delAuth">삭제</a>
                            </div>
                            </c:if>
                        </div>

                        <div class="listBox">
                            <div class="listTop">
                                <div class="listCnt">
                                    전체 <span id="selectAuthUserTotalCount">00</span> 건
                                </div>
                                <div class="listCntSel">
                                    <label>
                                        <select id="pageView" name="pageView">
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
                                     <tbody id="authUserList">
                                        
                                    </tbody>
                                </table>
                            </div>
                            <div class="paging" id="pagination"></div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 사용자 권한 등록 Modal-->
    <div class="modal" id="authMemModal">
        <div class="modalInner">
            <div class="modalTop">
                <h2>사용자 권한 등록</h2>
            </div>
            <div class="modalBody">
                <div class="modalBodyInner">
                    <div class="searchArea">
                        <div class="searchBox">
                            <span>검색어</span>
                            <label class="sel">
                                <select id="memModalSel">
                                    <option value="">아이디</option>
                                    <option value="">이름</option>
                                </select>
                            </label>
                            <label class="text btnBox">
                                <input type="text" id="searchWordpop" name="searchWordpop" placeholder="검색어 입력">
                                <a href="#" class="searchBtn">검색</a>
                            </label>
                        </div>
                    </div>
                    <div class="listBox">
                        <div class="listTop">
                            <div class="listCnt">
                                전체 <span id="totalCntpop">00</span> 건
                            </div>
                            <div class="listCntSel">
                                <label>
                                    <select id="pageViewpop" name="pageViewpop">
                                        <option value="10">10개씩</option>
                                        <option value="20">20개씩</option>
                                        <option value="30">30개씩</option>
                                        <option value="50">50개씩</option>
                                    </select>
                                </label>
                            </div>
                        </div>
                        <div class="tblList resTbl">
                            <table id="memModalList">
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
                                	<tbody id="userListpop">
                                        
                                    </tbody>
                            </table>
                        </div>
                        <div class="paging" id="paginationpop"></div>
                    </div>
                </div>
            </div>
            <div class="modalBtnArea">
                <a href="#" class="button app" id="addMemAuth">추가</a>
                <a href="#" class="button close" onclick="closeAuthModal(); return false;">취소</a>
            </div>
        </div>
    </div>

    <div class="mask"></div>
</body>
<script src="/cbdc_js/systemMng/auth/authDetailPage.js"></script>
<form name="authForm" id="authForm">
	<input type="hidden" name="saveType" id="saveType">
	<input type="hidden" name="detailType" id="detailType">
	<input type="hidden" name="authSeq" id="authSeq" value="${detailMap.AUTH_SEQ }">
	<input type="hidden" name="authCode" id="authCode" value="${detailMap.AUTH_CODE }">
</form>
</html>
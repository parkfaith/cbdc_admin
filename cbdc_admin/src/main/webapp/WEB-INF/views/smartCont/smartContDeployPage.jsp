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
                                            <span class="flag" id="status" data-seq="${selectDetail.SMART_SEQ}">
                                        </c:if>
                                        <c:if test="${selectDetail.SMART_STATUS == '점검완료'}">
                                            <span class="flag app" id="status" data-seq="${selectDetail.SMART_SEQ}">
                                        </c:if>
                                        <c:if test="${selectDetail.SMART_STATUS == '승인'}">
                                            <span class="flag com" id="status" data-seq="${selectDetail.SMART_SEQ}">
                                        </c:if>
                                        <c:if test="${selectDetail.SMART_STATUS == '반려'}">
                                            <span class="flag rej" id="status" data-seq="${selectDetail.SMART_SEQ}">
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
                                <h2>점검 결과</h2>
                            </div>
                            <div class="codePre">
                                <pre id="inputDataCode">
    <!-- pragma solidity ^0.6.0;

    contract HotelBook {
        enum Status { Vacant,Occupied }
        Status currentStatus;
        address payable public owner;
        
        event Occupy(address _occupant, uint _value);
        
        constructor() public {
            owner = msg.sender;
            currentStatus = Status.Vacant;
        }
        
        modifier onlyWhileVacant{
            require(currentStatus == Status.Vacant, "Book available");
            _;
        }
        modifier cost(uint _amount){
            require(msg.value >= _amount, "Not enough Ether");
            _;
        }
        
        receive() external payable onlyWhileVacant cost(2 ether) {
            currentStatus = Status.Occupied;
            owner.transfer(msg.value);
            emit Occupy(msg.sender, msg.value);
        }
        
    } -->
                                </pre>
                            </div>
                        </div>
		<c:if test="${selectDetail.SMART_CONBTN == 'REJECT'}">
		<div class="viewArea">
			<div class="viewTop">
            	<h2>반려</h2>
            </div>
				<div class="viewTbl">
				<table>
					<tr>
						<th>최종변경일시</th>
						<td>${selectDetail.UPD_DATE}</td>
						<th>처리자</th>
						<td>${selectDetail.UPD_ID}</td>
					</tr>
					<tr>
						<th>반려사유</th>
						<td colspan="3">${selectDetail.SMART_REJECTCOMM}</td>
					</tr>
				</table>
			</div>
		</div>	
		</c:if>
	
                        <div class="viewBtnArea">
                            <a href="/smartCont/smartContMngPage.do" class="button list">목록</a>

							<c:if test="${selectDetail.SMART_CONBTN == 'CHECKCODE'}">
	                            <!-- 승인권한자 (승인자) -->
	                            <a href="#" class="button app" id="confirm">승인</a>
	                            <a href="#" class="button rej" onclick="openModal('rejModal'); return false;">반려</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- 반려사유 입력 Modal-->
    <div class="modal" id="rejModal">
        <div class="modalInner">
            <div class="modalTop">
                <h2>반려사유 입력</h2>
            </div>
            <div class="modalBody">
                <div class="modalBodyInner">
                    <textarea placeholder="반려사유를 입력해주세요." id="rejectComm"></textarea>
                </div>
            </div>
            <div class="modalBtnArea">
                <a href="#" class="button app" id="rejSave">확인</a>
                <a href="#" class="button close" onclick="closeModal('rejModal'); return false;">취소</a>
            </div>
        </div>
    </div>
<div class="mask"></div>
</body>
<link rel="stylesheet" href="../css/codemirror.css">
    
<script src="../js/codemirror/codemirror.js"></script>
<script src="../js/codemirror/matchbrackets.js"></script>
<script src="../js/codemirror/python.js"></script>
<script src="/cbdc_js/smartCont/smartContDeployPage.js"></script>

</html>
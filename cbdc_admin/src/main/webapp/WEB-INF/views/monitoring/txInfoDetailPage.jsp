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
    	txDetail('');	
    });
    
    function copyCode(elementId){
        var aux = document.createElement("input");
        aux.setAttribute("value", document.getElementById(elementId).innerText);
        document.body.appendChild(aux);
        aux.select();
        document.execCommand("copy");
        document.body.removeChild(aux);
        alert('코드가 복사되었습니다.');
    }
    </script>
</head>
<body>
    <div class="wrap">
        <c:import url="/WEB-INF/views/import/cbdcAdminTop.jsp" />
        <div class="content">
            <c:import url="/WEB-INF/views/import/cbdcAdminLeft.jsp" />
            <div class="mainContent nav-mnt-tx">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="contTop">
                            <h2>거래정보 상세</h2>
                            <div class="breadcrum">
                                <dl>
                                    <dd><a href="#">home</a></dd>
                                    <dd>모니터링</dd>
                                    <dd>거래정보 상세</dd>
                                </dl>
                            </div>
                        </div>
                        
                        <div class="viewArea">
                            <div class="viewTbl" id="txInfoDetail">
                                
                            </div>
                            <div class="viewArea">
                            	<div class="viewTop">
                                	<h2>Input Data</h2>
                            	</div>
                            	<div class="codePre">
                                	<pre id="inputDataCode"></pre>
                            	</div>
                        	</div>
                        </div>
                        <div class="viewBtnArea">
                            <a href="/monitoring/txInfoPage.do" class="button list">목록</a>
                            <a href="#" class="button app" onclick="copyCode('inputDataCode'); return false;">코드복사</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/cbdc_js/monitoring/txInfoPage.js"></script>

</html>
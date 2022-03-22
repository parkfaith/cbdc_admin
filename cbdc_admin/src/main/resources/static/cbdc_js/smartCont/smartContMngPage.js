$(document).ready(function() {

	contractList(1);
	
	$("#perPage").change(function(){
		contractList(1);
	});
	
	$("#searchBtn").click(function(){
		contractList(1);
	})
});


function contractList(currentPage){

	let totCnt = 0;	
	let param = new Object();
	param.currentPage = currentPage;
	param.perPage = $("#perPage").val(); //n개씩보기
	param.searchType = $("#searchType").val(); //상태(전체,등록,점검완료..)
	param.searchWord = $("#searchWord").val(); //검색어
	
	cmm.callAjax('/smartCont/smartContList.json', 'POST', param, function(data){
		totCnt = data.totCnt;
		let html = '';
		var contNo = data.paginCnt;
		var classOp = "";
		
		if(data.list.length == 0 ) {
			html += '<tr><td colspan="8" class="empty">결과가 없습니다.</td></tr>';
		}else{
			$.each(data.list,function(i,item){
				switch(item.SMART_STATUS){
					case "등록" :
						classOp = "flag" 
					break;
					case "점검완료" :
						classOp = "flag app" 
					break;
					case "배포완료","승인" :
						classOp = "flag com" 
					break;
					case "반려" :
						classOp = "flag rej" 
					break;
				}
				
				html += '<tr>' 
					+ '<td class="num">' + contNo + '</td>'
	         		+ '<td class="sts">'
	          		+ '<span class="' + classOp + '">' + item.SMART_STATUS + '</span></td>'
	         		+ '<td><a href="#" onclick="goDetailPage(\'' + item.SMART_STATUS + '\',\'' + item.SMART_SEQ + '\')">'+ item.SMART_CONTNM + '</a></td>'
	          		+ '<td class="insti">'+ item.SMART_CONTID + '</td>'
	                + '<td class="insti">'+ item.SMART_VER + '</td>'
	                + '<td class="date">'+ item.REG_DATE + '</td>'
	                + '<td class="date">';
	                if(item.UPD_DATE != null) {
	                	html += item.UPD_DATE + '</td>';
					}else{
	                	html += '</td>';
					}
	            html += '<td class="writer">' +item.REG_ID + '</td>'
	            	 + '</tr>'
	                contNo--;
	                
			});
			var paging = data.paging;
			var paginationHtml = "";
			if(paging != null) {
				paginationHtml = paging;
			}
			
			
		}
		
		$("#contractList").html(html) //tbody id
		
		var pageHtml = cmmStr.characterUnEscapes(paginationHtml);
		$('#totCnt').text(totCnt);
		if(paging != null) {
			$('#paging').empty().append(pageHtml);
		}
	});
}

function goDetailPage(status,contSeq){
	var reqData = "";
	if(status == '등록') {
		reqData += "type=R";
	}else{
		reqData += "type=CC";
	}
	reqData += "&contSeq="
			+ parseInt(contSeq);
	
	location.href ="/smartCont/smartContDetail.do?" + reqData ;
	
}

function fnGoPaging(currentPage) {
	contractList(currentPage);
}
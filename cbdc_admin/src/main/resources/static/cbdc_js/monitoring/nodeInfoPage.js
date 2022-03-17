
$(document).ready(function() {
		
});

function nodeList(){
	let nodeCnt = 0;
	let param = new Object();
	
	cmm.callAjax('/monitoring/selectNodeList.json', 'POST', param, function(data){
		let info = data.nodeList;
		let nodeListHtml = "";
		if(info != null) {
			if(info.length > 0) {
				nodeCnt = info.length;
				$.each(info, function(i,item) {
					nodeListHtml +='<tr>';
					nodeListHtml +='<td class="num">000</td>';
					nodeListHtml +='<td class="sts"><span class="flag active">Active</span></td>';
					nodeListHtml +='<td><a href="#none" onClick="goDetailPage(\''+item.id+'\')">'+item.name+'</a></td>';
					nodeListHtml +='<td class="insti">한국은행</td>';
					nodeListHtml +='<td class="sts"><span class="node '+item.nodeType+'">'+item.nodeType+'</span></td>';
					nodeListHtml +='<td class="date">000,000</td>';
					nodeListHtml +='<td class="date">2021-00-00 00:00:00</td>';
					nodeListHtml += '</tr>';
				});
			}
		}else{
			nodeListHtml += '<tr><td colspan="7">검색결과가 없습니다</td></tr>';
		}
		
		$('#nodeInfoList').empty().html(nodeListHtml);
		$('#totalCnt').text(nodeCnt);
	});
}

function goDetailPage(nodeId){
	let form = document.nodeForm;
	
	form.nodeId.value = nodeId;
	
	form.action = '/monitoring/nodeDetailPage.do';
	form.method = 'post';
	form.target = '_self';
	form.submit();
}

function nodeDetail(selectNodeId){
	let nodeDetailHtml = "";
	let param = new Object();
	
	cmm.callAjax('/monitoring/selectNodeList.json', 'POST', param, function(data){
		let info = data.nodeList;
		if(info != null) {
			if(info.length > 0) {
				nodeCnt = info.length;
				$.each(info, function(i,item) {
					if(item.id==selectNodeId){
						nodeDetailHtml += '<table>';
						nodeDetailHtml += '	<colgroup>';
						nodeDetailHtml += '		<col>';
						nodeDetailHtml += '		<col width="36%">';
						nodeDetailHtml += '		<col>';
						nodeDetailHtml += '		<col width="36%">';
						nodeDetailHtml += '	</colgroup>';
						nodeDetailHtml += '	<tr>';
						nodeDetailHtml += '		<th>상태</th>';
						nodeDetailHtml += '		<td colspan="3">';
						nodeDetailHtml += '			<span class="flag active">Active</span>';
						nodeDetailHtml += '		</td>';
						nodeDetailHtml += '	</tr>';
						nodeDetailHtml += '	<tr>';
						nodeDetailHtml += '		<th>이름</th>';
						nodeDetailHtml += '		<td>Node #1</td>';
						nodeDetailHtml += '		<th>기관</th>';
						nodeDetailHtml += '		<td>한국은행</td>';
						nodeDetailHtml += '	</tr>';
						nodeDetailHtml += '	<tr>';
						nodeDetailHtml += '		<th>System Name</th>';
						nodeDetailHtml += '		<td colspan="3">'+item.name+'</td>';
						nodeDetailHtml += '	</tr>';
						nodeDetailHtml += '	<tr>';
						nodeDetailHtml += '		<th>유형</th>';
						nodeDetailHtml += '		<td>';
						nodeDetailHtml += '			<span class="node cn">CN</span>';
						nodeDetailHtml += '		</td>';
						nodeDetailHtml += '		<th>Block Height</th>';
						nodeDetailHtml += '		<td>00,000,000</td>';
						nodeDetailHtml += '	</tr>';
						nodeDetailHtml += '	<tr>';
						nodeDetailHtml += '		<th>Public Key</th>';
						nodeDetailHtml += '		<td colspan="3">';
						nodeDetailHtml += '			<div class="chkAccount">';
						nodeDetailHtml += '				<p id="walletAdd">C4234293uwdlfkslkdf02392lekjw</p>';
						nodeDetailHtml += '				<a href="#" class="button" onclick="copyAdd(\'walletAdd\'); return false;">copy</a>';
						nodeDetailHtml += '			</div>';
						nodeDetailHtml += '		</td>';
						nodeDetailHtml += '	</tr>';
						nodeDetailHtml += '	<tr>';
						nodeDetailHtml += '		<th>IP</th>';
						nodeDetailHtml += '		<td>10.10.10.1</td>';
						nodeDetailHtml += '		<th>체인 ID</th>';
						nodeDetailHtml += '		<td>1002</td>';
						nodeDetailHtml += '	</tr>';
						nodeDetailHtml += '	<tr>';
						nodeDetailHtml += '		<th>등록일</th>';
						nodeDetailHtml += '		<td>2021-00-00 00:00:00</td>';
						nodeDetailHtml += '		<th>등록자</th>';
						nodeDetailHtml += '		<td>홍길동</td>';
						nodeDetailHtml += '	</tr>';
						nodeDetailHtml += '	<tr>';
						nodeDetailHtml += '		<th>최종수정일시</th>';
						nodeDetailHtml += '		<td colspan="3">2021-00-00 00:00:00</td>';
						nodeDetailHtml += '	</tr>';
						nodeDetailHtml += '</table>';
					}else{
						
					}
				});
			}
		}else{
			nodeDetailHtml += '';
		}
		
		$('#nodeDetail').empty().html(nodeDetailHtml);
	});
}
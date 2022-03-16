
$(document).ready(function() {

	
});

function blockList(){
	let blockCnt = 0;
	let param = new Object();
	
	cmm.callAjax('/monitoring/selectBlockList.json', 'POST', param, function(data){
		let info = data.blockList;
		let blockListHtml = "";
		if(info != null) {
			if(info.length > 0) {
				blockCnt = info.length;
				$.each(info, function(i,item) {
					blockListHtml +='<tr>';
					blockListHtml +='<td class="num">000</td>';
					blockListHtml +='<td><a href="#none" onClick="goDetailPage(\''+item.blockHeightH+'\')">'+item.blockHeightD+'</a></td>';
					blockListHtml +='<td class="date">2021-00-00 00:00:00</td>';
					blockListHtml +='<td>'+item.creationNode+'</td>';
					blockListHtml +='<td>1</td>';
					blockListHtml +='<td>0</td>';
					blockListHtml += '</tr>';
				});
			}
		}else{
			blockListHtml += '<tr><td colspan="6">검색결과가 없습니다</td></tr>';
		}
		
		$('#blockInfoList').empty().html(blockListHtml);
		$('#totalCnt').text(blockCnt);
	});
}

function goDetailPage(blockId){
	let form = document.blockForm;
	
	form.blockId.value = blockId;
	
	form.action = '/monitoring/blockDetailPage.do';
	form.method = 'post';
	form.target = '_self';
	form.submit();
}

function blockDetail(selectBlockId){
	let param = new Object();
	let blockDetailHtml = "";
	
	cmm.callAjax('/monitoring/selectBlockInfo.json', 'POST', param, function(data){
		let info = data.blockInfoMap;
		if(info !=null){
			blockDetailHtml += '<table>';
			blockDetailHtml += '	<colgroup>';
			blockDetailHtml += '		<col>';
			blockDetailHtml += '		<col width="36%">';
			blockDetailHtml += '		<col>';
			blockDetailHtml += '		<col width="36%">';
			blockDetailHtml += '	</colgroup>';
			blockDetailHtml += '	<tr>';
			blockDetailHtml += '		<th>Block Height</th>';
			blockDetailHtml += '		<td>2,520,733</td>';
			blockDetailHtml += '		<th>Block Hash</th>';
			blockDetailHtml += '		<td>'+info.hash+'</td>';
			blockDetailHtml += '	</tr>';
			blockDetailHtml += '	<tr>';
			blockDetailHtml += '		<th>Tx. Count</th>';
			blockDetailHtml += '		<td>1</td>';
			blockDetailHtml += '		<th>Block Size</th>';
			blockDetailHtml += '		<td>'+info.size+' Byte</td>';
			blockDetailHtml += '	</tr>';
			blockDetailHtml += '	<tr>';
			blockDetailHtml += '		<th>Creation Node</th>';
			blockDetailHtml += '		<td>5</td>';
			blockDetailHtml += '		<th>Creation Time</th>';
			blockDetailHtml += '		<td>2021-00-00 00:00:00</td>';
			blockDetailHtml += '	</tr>';
			blockDetailHtml += '</table>';
		}else{
			
		}
		
		$('#blockDetail').empty().html(blockDetailHtml);
	});	
	
}

$(document).ready(function() {

	
});

function txList(){
	let txCnt = 0;
	let param = new Object();
	
	cmm.callAjax('/monitoring/selectTxList.json', 'POST', param, function(data){
		let info = data.txList;
		let txListHtml = "";
		/*
		if(info != null) {
			if(info.length > 0) {
				txCnt = info.length;
				$.each(info, function(i,item) {
					txListHtml +='<tr>';
					txListHtml +='<td><a href="#none" onClick="goDetailPage(\''+item.txHeightH+'\')">'+item.txHeightD+'</a></td>';
					txListHtml +='<td class="date">2021-00-00 00:00:00</td>';
					txListHtml +='<td>1</td>';
					txListHtml +='<td>0</td>';
					txListHtml += '</tr>';
				});
			}
		}else{
			txListHtml += '<tr><td colspan="4">검색결과가 없습니다</td></tr>';
		}
		*/
		txListHtml +='<tr>';
		txListHtml +='<td><a href="/monitoring/txInfoDetailPage.do">TransactionIDTransactionIDTransactionIDTransactionID</a></td>';
		txListHtml +='<td>&nbsp;</td>';
		txListHtml +='<td>&nbsp;</td>';
		txListHtml +='<td>&nbsp;</td>';
		txListHtml +='<td>&nbsp;</td>';
		txListHtml +='<td>&nbsp;</td>';
		txListHtml +='<td class="date">2021-00-00 00:00:00</td>';
		txListHtml += '</tr>';
					
		$('#txInfoList').empty().html(txListHtml);
		$('#totalCnt').text(txCnt);
	});
}

function goDetailPage(txId){
	let form = document.txForm;
	
	form.txId.value = txId;
	
	form.action = '/monitoring/txDetailPage.do';
	form.method = 'post';
	form.target = '_self';
	form.submit();
}

function txDetail(){
	let param = new Object();
	let txDetailHtml = "";
	
	cmm.callAjax('/monitoring/selectTxInfo.json', 'POST', param, function(data){
		let info = data.txInfoMap;
		/*
		if(info !=null){
			
		}else{
			
		}
		*/
		txDetailHtml += '<table>';
		txDetailHtml += '	<colgroup>';
		txDetailHtml += '		<col>';
		txDetailHtml += '		<col>';
		txDetailHtml += '	</colgroup>';
		txDetailHtml += '	<tr>';
		txDetailHtml += '		<th>Transaction Hash</th>';
		txDetailHtml += '		<td>TransactionIDTransactionIDTransactionIDTransactionID</td>';
		txDetailHtml += '	</tr>';
		txDetailHtml += '	<tr>';
		txDetailHtml += '		<th>Tx Receipt Status</th>';
		txDetailHtml += '		<td>Sucess</td>';
		txDetailHtml += '	</tr>';
		txDetailHtml += '	<tr>';
		txDetailHtml += '		<th>Block Height</th>';
		txDetailHtml += '		<td>0,000,000</td>';
		txDetailHtml += '	</tr>';
		txDetailHtml += '	<tr>';
		txDetailHtml += '		<th>TimeStamp</th>';
		txDetailHtml += '		<td>1 min ago(Jen-21-20-18 07:47:40 AM +UTC)</td>';
		txDetailHtml += '	</tr>';
		txDetailHtml += '	<tr>';
		txDetailHtml += '		<th>From Address</th>';
		txDetailHtml += '		<td>( A은행 ) <span class="hashCodeView">0x44d827f98430784c8e3401748d8ba92c43df4546</span></td>';
		txDetailHtml += '	</tr>';
		txDetailHtml += '	<tr>';
		txDetailHtml += '		<th>To Address</th>';
		txDetailHtml += '		<td>( B은행 ) <span class="hashCodeView">0x44d827f98430784c8e3401748d8ba92c43df4546</span></td>';
		txDetailHtml += '	</tr>';
		txDetailHtml += '	<tr>';
		txDetailHtml += '		<th>Value</th>';
		txDetailHtml += '		<td>0</td>';
		txDetailHtml += '	</tr>';
		txDetailHtml += '	<tr>';
		txDetailHtml += '		<th>Nonce</th>';
		txDetailHtml += '		<td>9</td>';
		txDetailHtml += '	</tr>';
		txDetailHtml += '</table>';
			
		$('#txInfoDetail').empty().html(txDetailHtml);
	});	
	
}
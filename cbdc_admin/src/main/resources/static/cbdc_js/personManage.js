let param = new Object();
param.search_sDate = '';
param.search_eDate = '';
param.search_type = '';
param.search_keyword = '';

$(document).ready(function() {
	goSearch();
	
	$("#btn_Search").click(function() {
		
		param.search_sDate = $("#search_sDate").val();
		param.search_eDate = $("#search_eDate").val();
		param.search_type = $("#search_type").val();
		param.search_keyword = $("#search_keyword").val();
		
		goSearch();
	});
});


function goSearch(){
	$.ajax({
        type : 'POST',
		data : param,
        url:'/systemMng/personManageListAjax.do',
        success:function(result)
        {
            let personList=result.personList;
            let res="";
            
            if(personList.length==0){
				res+='<tr>'
	                  +'<td colspan="8" class="empty">결과가 없습니다.</td>'
	                  +'</tr>';
			}else{
				for(let i=0;i<personList.length;i++)
	            {
	                 res+='<tr>'
	                  +'<td class="num">000</td>'
	                  +'<td class="user">'
	                  +'<a href="mngUserView.html">'+personList[i].user_id+'</a>'
	                  +'</td>'
	                  +'<td class="insti">'+personList[i].user_nm+'</td>'
	                  +'<td class="insti">승인/배포</td>'
	                  +'<td class="writer">'+personList[i].reg_id+'</td>'
	                  +'<td class="date">'+personList[i].reg_date+'</td>'
	                  +'</tr>';
	            }	
			}
            $('#person_list').html(res);
        }
      });
} 
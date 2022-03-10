$(document).ready(function() {

	menuList();	
	
	//전체 체크
    $(".chkAll").click(function(){
        var $chkArea = $(this).closest('table');
        if($(this).is(":checked") == true) {
            $chkArea.find('.authChk').prop("checked", true);
        }else{
            $chkArea.find('.authChk').prop("checked", false);
        }
    });
    
     $("#menuUpdateBtn").click(function(){
		let checkMenuNm = $.trim($('#menuNm').val());
		let checkMenuUrl = $.trim($('#menuUrl').val());
		let checkMenuDesc = $.trim($('#menuDesc').val());
		let checkMenuCnt = 0;
		
		if(checkMenuNm==''||checkMenuNm==null){
			checkMenuCnt = 1;
		}
		
		if(checkMenuUrl==''||checkMenuUrl==null){
			checkMenuCnt = 1;
		}
		
		if(checkMenuDesc==''||checkMenuDesc==null){
			checkMenuCnt = 1;
		}
		
		
		if(checkMenuCnt > 0){
			alert("필수 입력사항이 등록되지 않았습니다.");
			return false;
		}else{
			var c = confirm('메뉴정보를 수정하시겠습니까?');
	        if(c){
	        	menuUpdate();
	        }
        return false;	
		}
    });
    
    $("#menuDeleteBtn").click(function(){
		let checkCnt = $("#childMenuCnt").val();
		if(checkCnt > 0){
			alert("하위 메뉴가 있어 삭제할 수 없습니다.");
			return false;
		}else{
			var c = confirm('메뉴를 삭제하시겠습니까?');
        	if(c){
        		menuDelete();
        	}
        	return false;	
		}
	});
	
	$("#childMenuForm").click(function(){
		let form = document.menuForm;
		
    	form.action = "/systemMng/childMenuPage.do";
    	form.method = "post";
    	form.submit();
	});
});

function menuList(){
	$('#viewBtnArea').hide();
	$('#listBtn').hide();
	let depthCheck = 0;
	let downMenuCnt = 0;
	let param = new Object();
	
	let menuhtml = "<li>";
	menuhtml +='<a href="#" class="menuItem depth1">CBDC Admin</a>';
	menuhtml +='<ul>';
	cmm.callAjax('/systemMng/selectMenuList.json', 'POST', param, function(data){
		
		$.each(data.selectMenuList, function(i,item) {
			if(item.MENU_DEPTH == 2&&item.NODE_TYPE_NM == 'FILE'){
				menuhtml +='<li><a href="#none" onClick="javascript:selectMenu('+item.MENU_SEQ+')" class="menuItem depth2">'+item.MENU_NM+'</a></li>';
			}else if(item.MENU_DEPTH == 2&&item.NODE_TYPE_NM == 'FOLDER'){
				menuhtml +='<li><a href="#none" onClick="javascript:selectMenu('+item.MENU_SEQ+')" class="menuItem depth2">'+item.MENU_NM+'</a>';
				downMenuCnt = item.DOWUNMENU_CNT
			}
			
			if(item.MENU_DEPTH == 3){
				if(depthCheck ==0 ){
					menuhtml +='<ul>';
				}
				menuhtml +='<li><a href="#none" onClick="javascript:selectMenu('+item.MENU_SEQ+')" class="menuItem depth3">'+item.MENU_NM+'</a></li>';
				depthCheck++;
				if(depthCheck ==downMenuCnt ){
					menuhtml +='</ul></li>';
					depthCheck = 0;
				}
			}
		});
		menuhtml +='</ul></li>';
		//console.log(menuhtml);
		$('#menuTreeList').empty().html(menuhtml);
		JSLists.applyToList('menuTreeList', 'ALL', 'openAll');
		
	});
}

function selectMenu(menu_seq){
	$('#viewBtnArea').show();
	let param = new Object();
	param.menuSeq = menu_seq;
	$('#menuSeq').val(menu_seq);
	
	cmm.callAjax('/systemMng/selectMenuInfo.json', 'POST', param, function(data){
		let menuInfo = data.selectMenuInfo;
		let selectedMenu = "";
		$('#menuNm').val(menuInfo.MENU_NM);
		$('#menuUrl').val(menuInfo.MENU_URL);
		$('#menuDesc').val(menuInfo.MENU_DESC);
		$('#childMenuCnt').val(menuInfo.CHILDMENU_CNT);
		
		$('#regNm').text(menuInfo.REG_NM);
		$('#regDate').text(menuInfo.REG_DATE);
		$('#updNm').text(menuInfo.UPD_NM);
		$('#updDate').text(menuInfo.UPD_DATE);
		
		if(menuInfo.MENU_DEPTH ==2 ){
			$("#upperMenu").empty().append('<option value="ROOT">CBDC Admin</option>');
			$('#listBtn').show();
		}else if(menuInfo.MENU_DEPTH ==3 ){
			$('#listBtn').hide();
			$("#upperMenu").empty();
			$.each(data.selectUpperMenuList, function(i,item) {
				selectedMenu = "";
				if(item.MENU_SEQ==menuInfo.MENU_PCODE){
					selectedMenu = "selected";
				}
				$("#upperMenu").append('<option value="'+item.MENU_SEQ+'" '+selectedMenu+'>'+item.MENU_NM+'</option>');	
			});	
		}else{
			$("#upperMenu").empty().append('<option value="ROOT">CBDC Admin</option>');	
		}
		
		let authhtml = "";
		if(data.selectAuthListNoPaging.length < 1){
				authhtml +='<tr>';
				authhtml +='<td colspan="4" class="empty">결과가 없습니다.</td>';
				authhtml +='</tr>';
			}else{
				$.each(data.selectAuthListNoPaging, function(i,item) {
					let checkedShow = "";
					let tempCnt = 0;
					let menuAuthCode = menuInfo.MENU_AUTH;
					if(menuAuthCode==""||menuAuthCode==null){
						
					}else{
						const arr = menuAuthCode.split(',');
						arr.forEach(function(element){
							if(element==item.AUTH_CODE){
								tempCnt++;
							}
						});
						
						if(tempCnt > 0){
							checkedShow = "checked";
						}
					}
					
	    			authhtml +='<tr>';
	    			authhtml +='<td class="num">';
	    			authhtml +='<label><input type="checkbox" class="authChk" name="chkListAuth" id="chkListAuth" '+checkedShow+' value="'+item.AUTH_CODE+'"></label>'
					authhtml +='</td>'
					authhtml +='<td class="auth">'+item.AUTH_CODE+'</td>'
					authhtml +='<td class="auth">'+item.AUTH_NM+'</td>'
					authhtml +='<td class="insti">'+item.AUTH_DESC+'</td>'
	    			authhtml +='</tr>';
	    		});
				
			}
		$('#authList').empty().html(authhtml);
	});
}

function menuUpdate(){
	let select_obj = '';
	let obj = new Object();
	obj.menuSeq =$.trim($('#menuSeq').val());
	obj.menuNm =$.trim($('#menuNm').val());
	obj.menuUrl =$.trim($('#menuUrl').val());
	obj.menuDesc =$.trim($('#menuDesc').val());
	obj.menuUppercode =$.trim($('#upperMenu').val());
	obj.saveType = "U";
	
	let chkListAuthLen = $("input[name='chkListAuth']:checked").length;
	if(chkListAuthLen < 1){
		obj.menuAuth = "";	
	}else{
		$("input[name='chkListAuth']:checked").each(function (index) {
	        if (index != 0) {
	            select_obj += ',';
	        }
	        select_obj += $(this).val();
	        
	    });	
	    obj.menuAuth = 	select_obj;
	}
	 
	cmm.callAjax('/systemMng/cudMenuInfoAjax.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("메뉴정보가 수정되었습니다.");
			selectMenu(obj.menuSeq);
			menuList();	
		} else {
			alert("메뉴정보 수정에 에러가 발생했습니다.");
			return false;
		}
	});
}

function menuDelete(){
	
	var obj = new Object();
	obj.menuSeq =$.trim($('#menuSeq').val());
	obj.saveType = "D";
	 
	cmm.callAjax('/systemMng/cudMenuInfoAjax.json', 'POST', obj, function(data){
		var resultCode = data.resultCode;
		
		if("200" == resultCode) {
			alert("메뉴가 삭제되었습니다.");
			var goUrl = "/systemMng/menuMngPage.do";
	    	$(location).attr('href',goUrl);
		} else {
			alert("메뉴 삭제에 에러가 발생했습니다.");
			return false;
		}
	});
}

function InsertFormUpperMenu(menuSeq){
	
}
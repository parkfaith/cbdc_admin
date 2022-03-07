$(document).ready(function() {

	menuList();	
});

function menuList(){
	let depthCheck = 0;
	let param = new Object();
	
	let menuhtml = "<li>";
	menuhtml +='<a href="#" class="menuItem depth1">CBDC Admin</a>';
	menuhtml +='<ul>';
	cmm.callAjax('/systemMng/selectMenuList.json', 'POST', param, function(data){
		
		$.each(data.selectMenuList, function(i,item) {
			if(item.MENU_DEPTH == 2&&item.NODE_TYPE_NM == 'FILE'){
				menuhtml +='<li><a href="#" class="menuItem depth2">'+item.MENU_NM+'</a></li>';
			}else if(item.MENU_DEPTH == 2&&item.NODE_TYPE_NM == 'FOLDER'){
				menuhtml +='<li><a href="#" class="menuItem depth2">'+item.MENU_NM+'</a>';
			}
			
			if(item.MENU_DEPTH == 3){
				if(depthCheck ==0 ){
					menuhtml +='<ul>';
				}
				menuhtml +='<li><a href="#" class="menuItem depth3">'+item.MENU_NM+'</a></li>';
				depthCheck++;
				if(depthCheck ==3 ){
					menuhtml +='</ul></li>';
					depthCheck = 0;
				}
			}
		});
		menuhtml +='</ul></li>';
		console.log(menuhtml);
		$('#menuTreeList').empty().html(menuhtml);
		JSLists.applyToList('menuTreeList', 'ALL', 'openAll');
	});
}
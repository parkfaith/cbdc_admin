<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="leftMenu">
 
    <nav>
        <ul id="leftMenuTreeList">
        <!-- 
            <li><a id="nav-node-mng" href="/">노드관리</a></li>
<li class="sub">
	<a href="#">모니터링</a>
	<ul class="subMenu">
		<li><a id="nav-mnt-node" href="/monitoring/nodeInfo.do">노드정보</a></li>
		<li><a id="nav-mnt-block" href="/monitoring/blockInfo.do">블록정보</a></li>
		<li><a id="nav-mnt-tx" href="/">거래정보</a></li>
	</ul>
</li>
<li><a id="nav-smt-cnrt" href="/">스마트계약관리</a></li>
<li class="sub">
	<a href="#">대시보드</a>
	<ul class="subMenu">
		<li><a id="undefined" href="/">테스트</a></li>
	</ul>
</li>
<li class="sub">
	<a href="#">시스템관리</a>
	<ul class="subMenu">
		<li><a id="undefined" href="/">하위메뉴</a></li>
		<li><a id="nav-mng-user" href="/systemMng/userMngPage.do">사용자관리</a></li>
		<li><a id="nav-mng-menu" href="/systemMng/menuMngPage.do">메뉴관리</a></li>
		<li><a id="nav-mng-auth" href="/systemMng/authMngPage.do">권한관리</a></li>
	</ul>
</li>
         -->
        </ul>
    </nav>
    
</div>
<script>
$(document).ready(function() {
	leftMenuList();
});

function leftMenuList(){
	let leftMenuhtml = "";
	let param = new Object();
	let leftdepthCheck = 0;
	let leftdownMenuCnt = 0;
	cmm.callAjax('/systemMng/selectMenuList.json', 'POST', param, function(data){
		
		$.each(data.selectMenuList, function(i,item) {
			
			if(item.MENU_DEPTH == 2&&item.NODE_TYPE_NM == 'FILE'){
				leftMenuhtml +='<li><a id="'+item.MENU_ID+'" href="'+item.MENU_URL+'">'+item.MENU_NM+'</a></li>';
			}else if(item.MENU_DEPTH == 2&&item.NODE_TYPE_NM == 'FOLDER'){
				leftMenuhtml +='<li class="sub"><a href="#">'+item.MENU_NM+'</a>';
				leftdownMenuCnt = item.DOWNMENU_CNT;
			}
			if(item.MENU_DEPTH == 3){
				if(leftdepthCheck ==0 ){
					leftMenuhtml +='<ul class="subMenu">';
				}
				leftMenuhtml +='<li><a id="'+item.MENU_ID+'" href="'+item.MENU_URL+'">'+item.MENU_NM+'</a></li>';
				leftdepthCheck++;
				if(leftdepthCheck ==leftdownMenuCnt ){
					leftMenuhtml +='</ul></li>';
					leftdepthCheck = 0;
				}
			}
			
		});
		//leftMenuhtml +='</ul></li>';
		console.log(leftMenuhtml);
		$('#leftMenuTreeList').empty().html(leftMenuhtml);
		setMenu();
	});
	
	//leftMenuhtml +='</nav></ul>';
	
}
</script>
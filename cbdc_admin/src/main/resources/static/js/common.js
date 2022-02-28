//js
$(window).ready(function() {
    //메뉴설정
    setMenu();
    
    $("a.dashMenu").click(function(){
        if( $(this).hasClass('show') ){
            $(this).removeClass('show');
            $(".content .leftMenu").removeClass('show');
        }else{
            $(this).addClass('show');
            $(".content .leftMenu").addClass('show');
        }
        return false;
    });
    
    //사용자 메뉴 (상단 로그인 정보)
    $("a.userBox").click(function(){
        if( $(this).hasClass('on') ){
            $(this).removeClass('on');
            $('.userList').removeClass('on');
        }else{
            $(this).addClass('on');
            $('.userList').addClass('on');
        }
        return false;
    });

    $('html').click(function(e){ 
        if($(e.target).parents('.userList').length < 1){ 
            $("a.userBox").removeClass('on');
            $('.userList').removeClass('on');
        } 
    });

    //서브 메뉴있는 GNB 클릭 시
    $("nav ul li.sub a").click(function(){
        if( !$(this).parent().parent('ul').hasClass('subMenu') ){
            if( $(this).parent().hasClass('on') ){
                $(this).parent().removeClass('on');
            }else{
                $(this).parent().addClass('on');
            }
            return false;
        }
    });

    // Table Th sorting 기능 관련
    $("a.sort").click(function(){
        if( $(this).hasClass('desc') ){
            $(this).attr('class','sort');
        }else if( $(this).hasClass('asc') ){
            $(this).attr('class','sort desc');
        }else{
            $(this).attr('class','sort asc');
        }
        return false;
    });

});

$(window).resize(function() {

});

$(window).scroll(function(){
    
});

//숫자콤마
function comma(str) {
    str = str.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
    str = str.replace(/,/g,'');          // ,값 공백처리
    str = str.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가 
    if( !str && $(".transKor").length > 0){ $(".transKor").html(''); }
    return str;
}

//숫자 국문 변환
function _fmtNumberKor(num) {
    num = parseInt((num + '').replace(/[^0-9]/g, ''), 10) + ''; // 숫자/문자/돈 을 숫자만 있는 문자열로 변환
    if(num == '0')
        return '영';

    var number = ['영', '일', '이', '삼', '사', '오', '육', '칠', '팔', '구'];
    var unit = ['', '만', '억', '조'];
    var smallUnit = ['천', '백', '십', ''];
    var result = []; //변환된 값을 저장할 배열
    var unitCnt = Math.ceil(num.length / 4); //단위 갯수. 숫자 10000은 일단위와 만단위 2개이다.
    num = num.padStart(unitCnt * 4, '0') //4자리 값이 되도록 0을 채운다
    var regexp = /[\w\W]{4}/g; //4자리 단위로 숫자 분리
    var array = num.match(regexp);
    //낮은 자릿수에서 높은 자릿수 순으로 값을 만든다(그래야 자릿수 계산이 편하다)
    for(var i = array.length - 1, unitCnt = 0; i >= 0; i--, unitCnt++) {
        var hanValue = _makeHan(array[i]); //한글로 변환된 숫자
        if(hanValue == '') //값이 없을땐 해당 단위의 값이 모두 0이란 뜻.
        continue;
        result.unshift(hanValue + unit[unitCnt]); //unshift는 항상 배열의 앞에 넣는다.
    }
    //여기로 들어오는 값은 무조건 네자리이다. 1234 -> 일천이백삼십사
    function _makeHan(text) {
        var str = '';
        for(var i = 0; i < text.length; i++) {
            var num = text[i];
            if(num == '0') //0은 읽지 않는다
            continue;
            str += number[num] + smallUnit[i];
        }
        return str;
    }
    return result.join('');
}

//로딩 보이기
function loading(){
    var html_ = '<div class="loading">';
        html_ += '<div class="loadingBox">';
        html_ += '<div class="sk-fading-circle">';
        html_ += '<div class="sk-circle1 sk-circle"></div>';
        html_ += '<div class="sk-circle2 sk-circle"></div>';
        html_ += '<div class="sk-circle3 sk-circle"></div>';
        html_ += '<div class="sk-circle4 sk-circle"></div>';
        html_ += '<div class="sk-circle5 sk-circle"></div>';
        html_ += '<div class="sk-circle6 sk-circle"></div>';
        html_ += '<div class="sk-circle7 sk-circle"></div>';
        html_ += '<div class="sk-circle8 sk-circle"></div>';
        html_ += '<div class="sk-circle9 sk-circle"></div>';
        html_ += '<div class="sk-circle10 sk-circle"></div>';
        html_ += '<div class="sk-circle11 sk-circle"></div>';
        html_ += '<div class="sk-circle12 sk-circle"></div>';
        html_ += '</div>';
        html_ += '</div>';
        html_ += '</div>';
    
    $('body').append(html_);
    $(".loading").show();
    if( $(".mainDash").length > 0 ){
        $(".loading").addClass('mainDash');
    }
}

//로딩 감추기
function hideLoading(){
    $(".loading").fadeOut();
    setTimeout(function(){
        $(".loading").remove();
    },500);
}

// 팝업창 보이기
function openModal(moId){
    $(".mask").fadeIn();
    $("#"+moId).show();
}

// 팝업창 감추기
function closeModal(moId){
    $(".mask").fadeOut();
    $("#"+moId).hide();
}

//메뉴설정
function setMenu(){
    var getMenuCode = $(".mainContent").attr('class').split('mainContent ')[1];
    if(getMenuCode){
        $('#'+getMenuCode).closest('.sub').addClass('on');
        $('#'+getMenuCode).parent().addClass('on');
    }
}
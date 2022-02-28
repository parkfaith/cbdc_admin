function navHeightChk(){
    $(".navInner").height( $('nav').height() - 140 );
}

function showLoading(){
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
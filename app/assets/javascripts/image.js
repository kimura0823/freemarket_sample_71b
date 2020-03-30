$(function(e) {  
  $('.slider').slick({
    asNavFor:'.icon__image',
    arrows: false,
    fade: true,
    slidesToShow:1,
  });

  $('.small-image').mouseover(function(){
    // "_thumb"を削った画像ファイル名を取得
    var selectedSrc = $(this).attr('src').replace(/^(.+)_thumb(\.gif|\.jpg|\.png+)$/, "$1"+"$2");
    // 画像入れ替え
    $('.top-image').stop().fadeOut(50,
    function(){
    $('.top-image').attr('src', selectedSrc);
    $('.top-image').stop().fadeIn(200);
    }
    );
    // サムネイルの枠を変更
    $(this).css({"border":"2px solid #3CCACE"});
    });
    
    // マウスアウトでサムネイル枠もとに戻す
    $('.small-image').mouseout(function(){
    $(this).css({"border":""});
    });
});



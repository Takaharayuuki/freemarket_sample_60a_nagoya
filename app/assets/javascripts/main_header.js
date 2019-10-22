$(document).on('turbolinks:load', function() {
  $('#input-box').focusin(function() {
    $(this).css({
      'border-color': '#038de3',
      'transition': '.5s' 
    })
  }).focusout(function() {
    $(this).css({
      'border-color': 'rgb(204, 204, 204)'
    })
  })



  $("#likes-box").hover(function() {
    $(".fa-heart").css({
      "color": "#038de3"
    });
    $(".likes-text").css({
      "color": "#038de3",
      "transition": ".3s"
    });
  }, function() {
    $(".fa-heart").css({
      "color": "rgb(204, 204, 204)"
    });
    $(".likes-text").css({
      "color": ""
    });
  })


  $("#notice-box").hover(function() {
    $(".fa-bell").css({
      "color": "#038de3"
    });
    $(".notice-text").css({
      "color": "#038de3",
      "transition": ".3s"
    });
  }, function() {
    $(".fa-bell").css({
      "color": "rgb(204, 204, 204)"
    });
    $(".notice-text").css({
      "color": ""
    });
  })


  $("#list-box").hover(function() {
    $(".fa-check").css({
      "color": "#038de3"
    });
    $(".list-text").css({
      "color": "#038de3",
      "transition": ".3s"
    });
  }, function() {
    $(".fa-check").css({
      "color": "rgb(204, 204, 204)"
    });
    $(".list-text").css({
      "color": ""
    });
  })


  $("#mypage-box").hover(function() {
    $(".m-text").css({
      "color": "#038de3",
      "transition": ".3s"
    });
  }, function() {
    $(".m-text").css({
      "color": ""
    });
  })

  $(".m-container__bottom__left__category").hover(function() {
    console.log("ok");
  }, function() {
    console.log("ok");
  });


  // ブランドのドロップダウンメニュー
  $(".m-container__bottom__left__brand").hover(function() {
    $(".brand-drop-down").show();
  }, function() {
    $(".brand-drop-down").hide();
  });
})
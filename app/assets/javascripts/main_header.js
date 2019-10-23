$(document).on('turbolinks:load', function() {
  //検索ボックス
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

  //いいね一覧
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

  //お知らせ一覧
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

  //やることリスト
  $("#todo-box").hover(function() {
    $(".fa-check").css({
      "color": "#038de3"
    });
    $(".todo-text").css({
      "color": "#038de3",
      "transition": ".3s"
    });
  }, function() {
    $(".fa-check").css({
      "color": "rgb(204, 204, 204)"
    });
    $(".todo-text").css({
      "color": ""
    });
  })

  //マイページ
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

  //親カテゴリーのドロップダウンメニュー
  $(".m-container__bottom__left__category").hover(function() {
    $(".m-category-list__parents").show();
    $(".m-category-text").css({
      "color": "#038de3"
    });
  }, function() {
    $(".m-category-list__parents").hide();
    $(".m-category-text").css({
      "color": ""
    });
  });

  //子カテゴリーのドロップダウンメニュー
  function buildChildHTML(child) {
    var html = `<a class="m-child_category" id="${child.id}"
                href="#">${child.name}</a>`
  } 

  $(".m-parent-category").on("mouseover", function() {
    var id = this.id
    $.ajax({
      type: "get",
      url: "/items/category_menu_children",
      data: {parent_id: id},
      dataType: "json"
    }).done(function(children) {
      
    })
  });


  //ブランドのドロップダウンメニュー
  $(".m-container__bottom__left__brand").hover(function() {
    $(".brand-drop-down").show();
    $(".m-brand-text").css({
      "color": "#038de3"
    });
  }, function() {
    $(".brand-drop-down").hide();
    $(".m-brand-text").css({
      "color": ""
    });
  });
})
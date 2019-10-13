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

  $("#likes-box").on("mouseover", function() {
    $(".fa-heart").css({
      "color": "#038de3"
    }).on('mouseout', function() {
      $(".fa-heart").css({
        "color": "rgb(204, 204, 204)"
      })
    })

  })
})
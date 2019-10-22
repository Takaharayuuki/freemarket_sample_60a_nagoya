$(document).on("turbolinks:load", function() {
  $(".m-container__bottom__left__category").hover(function() {
    console.log("ok");
  }, function() {
    console.log("ok");
  });

  $(".m-container__bottom__left__brand").hover(function() {
    $(".brand-drop-down").show();
  }, function() {
    $(".brand-drop-down").hide();
  });
});
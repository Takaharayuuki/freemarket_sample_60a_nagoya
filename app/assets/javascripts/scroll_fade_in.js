$(window).scroll(function () {
  $(".fadein").each(function(index) {
    let delay = 0.05 * index;
    $(this).css({
      "transition-delay": delay + "s"
    });
    let elemPos = $(this).offset().top,
      scroll = $(window).scrollTop(),
      windowHeight = $(window).height();
      if (scroll > elemPos - windowHeight) {
        $(this).addClass("scrollin")
      }
    });
});

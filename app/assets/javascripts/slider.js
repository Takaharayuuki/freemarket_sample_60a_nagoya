$(document).on('turbolinks:load', function() {
  $('.m-wrapper__slider__pictures').slick({
    autoplay: true,
    infinite: true,
    dots: true,
    autoplaySpeed: 5000
  })
});
$(document).on('turbolinks:load', function() {
  $('#help-text').on('click', function() {
    $('#help-fig').removeClass('hide-help-fig')
  })
  $(document).on('click', function(e){
    if (!$(e.target).closest('#help-text').length)
    $('#help-fig').fadeOut();
  })
  $('#help-text').on('click', function(e){
    if (!$(e.target).closest('#help-text').length)
    $('#help-fig').fadeIn();
  })
});
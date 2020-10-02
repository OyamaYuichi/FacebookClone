$(function() {
  $('#accordion dd').hide();
  $('#accordion dt').on('click', function(){
    $(this).nextAll('dd').slideToggle();
  });
});

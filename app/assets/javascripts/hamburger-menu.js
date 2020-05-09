$(document).on('turbolinks:load', function() { 
  $('.menu-icon').on('click', function(){
    $('.header-right').toggleClass('is-active');
  });
});
$(document).on('turbolinks:load', function() { 
  $('.menu-icon').on('click', function(){
  // console.log("OK");
    $('.header-right').toggleClass('is-active');
  });
});
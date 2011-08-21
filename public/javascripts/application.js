// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


jQuery(function($) {
  $('.show_all_btn').click(function() {
    $(this).parent('table').toggleClass('show_all');
    return false;
  });
});
// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


jQuery(function($) {
  $('a.show_all_btn').click(function() {
    $(this).parents('table').toggleClass('show_all');
    return false;
  });
  
  
  var original_nav_item_url = $('#nav_item_url').val();
  $('#nav_item_url_select_').change(function() {
    var new_val = '';
    if ($(this).val() == '') {
      new_val = original_nav_item_url
    } else {
      new_val = $(this).val();
    }
    
    $('#nav_item_url').val(new_val);
    
  });
});
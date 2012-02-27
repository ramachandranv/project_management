// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-dropdown
//= require bootstrap-modal
//= require_tree .

$(document).ready(function(){
  preview_text = $("#page_content").val();
  if (preview_text) {
    preview_text = preview_text.replace(/<\/?[^>]+(>|$)/g, " "); 
    $(".content_preview").text(preview_text);
  }
  $("#page_content").keyup(function(e){
    if (e.keyCode != 188) { 
      page_content = $(this).val();
      text = page_content.replace(/<\/?[^>]+(>|$)/g, " "); 
      lastchar = page_content.charAt(page_content.length - 1);
      if (lastchar != "<") {
        $(".page_preview .content_preview").text(text);
      }
    }
  }); 
});

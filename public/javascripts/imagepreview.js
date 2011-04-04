$(document).ready(function() {
  alert("its loaded");
  $("input").click(function(event){
    $("iframe").contents().find("#image_image").trigger('click');
    event.preventDefault();
  });
 });

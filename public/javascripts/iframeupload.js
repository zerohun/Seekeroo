alert('hha');

function crateResponder(target_id)
{
  
  respond_from_server = new Function("image_src", 
    "$('#preview').append('<img src=' + image_src + ' />')");

}
function createUploadIframe(iframe_src, fileinput_id, form_id, triggerbutton_id)
{
  iframe_id = 'uploadFrame';
  $('<iframe />',{
    name: 'uploadFrame',
    id: iframe_id,
    src: iframe_src
  }).appendTo("body");
  
  $('#' + triggerbutton_id).click(function(event){

    $('#' + iframe_id).contents().find('#image_image').change(function(){
   //   $('#' + form_id).submit();
      $('#' + iframe_id).contents().find('#image_submit').trigger('click');
    });
    $('#' + iframe_id).contents().find('#' + fileinput_id).trigger('click');

    event.preventDefault();
  });

}

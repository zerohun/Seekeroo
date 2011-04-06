function crateResponder(target_id)
{
  
  respond_from_server = new Function("image_src", "image_id",
    "$('#" + target_id + "').attr('src',image_src);\n$('#article_image_id').val(image_id);");

}
function createUploadIframe(iframe_src, fileinput_id, form_id, triggerbutton_id)
{
  iframe_id = 'uploadFrame';
  $('<iframe />',{
    name: 'uploadFrame',
    id: iframe_id,
    src: iframe_src
  }).appendTo("body");

 $('#' + iframe_id).load(function(){
    $('#' + iframe_id).contents().find('#image_image').change(function(){
      $('#' + iframe_id).contents().find('#image_submit').trigger('click');
    });
 });
  
  $('#' + triggerbutton_id).click(function(event){


    $('#' + iframe_id).contents().find('#' + fileinput_id).trigger('click');

    event.preventDefault();
  });

}

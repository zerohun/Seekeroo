
// This for uploading image file throught iframe
// it generate iframe and trigger file upload

function createResponder(target_id)
{ 
  respond_from_server = new Function("image_src", "image_id",
    "$('#{0}').attr('src',image_src);".format(target_id) +
    "$('#article_image_id').val(image_id);");
}

function createUploadIframe(iframe_id, iframe_name, iframe_src, fileinput_id, form_id, triggerbutton_id)
{

 iframeHTML=JST.upload_iframe({name: iframe_name, id: iframe_id, src: iframe_src});
 $("body").append(iframeHTML);

 iframe = $('#' + iframe_id);
 triggerbutton = $('#' + triggerbutton_id);

 iframe.load(function(){
      iframe.contents().find('#image_image').change(function(){
          iframe.contents().find('#image_submit').trigger('click');
      });
 });

 triggerbutton.click(function(event){
    iframe.contents().find('#' + fileinput_id).trigger('click');
  });

}

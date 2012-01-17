function createResponder(target_id, hiddenfield_id)
{
  var inputtohiddenfield = "";
  if(hiddenfield_id != "")
  {
    inputtohiddenfield = 
            "jQuery('#{0}').val(image_id);".format(hiddenfield_id);
  }
  respond_from_server = new Function("image_src", 
                                     "image_id", 
                                     "image_width",
                                     "image_height",

    "jQuery('#{0}').attr('src',image_src);".format(target_id) +
    "jQuery('#{0}').data('width', image_width);".format(target_id) +
    "jQuery('#{0}').data('height', image_height);".format(target_id) +
    inputtohiddenfield + 
    "refreshImageSize();" + 
    "$('#image_loading').html('');");

}

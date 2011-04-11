function createResponder(target_id, hiddenfield_id)
{
  var inputtohiddenfield = "";
  if(hiddenfield_id != "")
  {
    inputtohiddenfield = 
            "$('#{0}').val(image_id);".format(hiddenfield_id);
  }
  respond_from_server = new Function("image_src", "image_id",
    "$('#{0}').attr('src',image_src);".format(target_id) +
    inputtohiddenfield);
}

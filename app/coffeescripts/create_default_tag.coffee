@refreshImageSize = ->
  width = $("img#previewimg").data("width")
  height = $("img#previewimg").data("height")

  $("input#article_tagboxes_attributes_0_left").val(0)
  $("input#article_tagboxes_attributes_0_top").val(0)
  $("input#article_tagboxes_attributes_0_width").val(width)
  $("input#article_tagboxes_attributes_0_height").val(height)



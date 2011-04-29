$("img#previewimg").change(->
  width = $("img#previewimg").data("width")
  height = $("img#previewimg").data("height")

  $("input#article_tagboxes_attributes_0_left").value(0)
  $("input#article_tagboxes_attributes_0_top").value(0)
  $("input#article_tagboxes_attributes_0_width").value(width.to_s)
  $("input#article_tagboxes_attributes_0_height").value(height.to_s)

)

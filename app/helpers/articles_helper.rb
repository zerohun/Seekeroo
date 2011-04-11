module ArticlesHelper

  def iframe_for_upload(url, file_input_id, form_id)
    generated_html = ""
    generated_html += include_javascripts :image_upload
    onloadeventcode = on_document_ready(
      "\ncreateUploadIframe('upload_iframe', 'upload_iframe',\n" +
      "'#{url}', '#{file_input_id}', '#{form_id}', 'fileupload');")

    generated_html += onloadeventcode
    generated_html += "\n<button type='button' id='fileupload'>Upload File</button>"
    generated_html.html_safe
  end

  def image_preview(target, image)
    previewimgid = "#{target.to_s}_#{image.to_s}_id"
    generated_html =""
    generated_html += include_javascripts :image_preview
    onload_code = on_document_ready(
     "\ncreateResponder('previewimg', '#{previewimgid}');"
    );
    generated_html += onload_code
    generated_html += "\n<div id='previewdiv'>"
    generated_html += "\n  <img id='previewimg'></img>"
    generated_html += "\n</div>"
    generated_html += hidden_field(target, :"#{image}_id") 
    generated_html.html_safe
  end
end

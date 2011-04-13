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

  def image_preview(target, image_model_name)
    previewimgid = "#{model_name_of(target)}_#{image_model_name.to_s}_id"
    generated_html =""
    generated_html += include_javascripts :image_preview
    onload_code = on_document_ready(
     "\ncreateResponder('previewimg', '#{previewimgid}');"
    );
    generated_html += onload_code
    generated_html += "\n<div id='previewdiv'>"
    if target.image_id != nil
      generated_html += "\n  <img id='previewimg' src='#{size_for_pc_image_path(target.image_id)}'></img>"
    else
      generated_html += "\n  <img id='previewimg'></img>"
    end
    generated_html += "\n</div>"
    generated_html += hidden_field(model_name_of(target), :"#{image_model_name}_id") 
    generated_html.html_safe
  end
end

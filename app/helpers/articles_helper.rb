module ArticlesHelper

  def image_preview(target, image_model_name)
    previewimgid = "#{model_name_of(target)}_#{image_model_name.to_s}_id"
    generated_html =""
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

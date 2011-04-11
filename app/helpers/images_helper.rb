module ImagesHelper
  def send_to_parent_from(image_model_obj)
    
    generated_html = ""
    if image_model_obj.id != nil
      image_model_name = image_model_obj.class.to_s.downcase
      image_url_method = method(:"#{image_model_name}_path");
      new_image_path = image_url_method.call(image_model_obj);
      generated_html += "<script type='text/javascript'>"
      generated_html += "\n   window.parent.respond_from_server('#{new_image_path}',"
      generated_html += "\n                '#{image_model_obj.id}');"
      generated_html += "</script>"
    end
    generated_html.html_safe
  end

end

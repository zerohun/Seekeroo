module ApplicationHelper

  def on_document_ready(scriptstring)
    generated_html = ""
    generated_html += "\n<script type='text/javascript'>"
    generated_html += "\njQuery(document).ready(function() {"
    generated_html += "\n#{scriptstring}"
    generated_html += "\n});"
    generated_html += "\n</script>"
    generated_html
  end

  def model_name_of(model_obj)
    model_name = model_obj.class.to_s.downcase
  end

end

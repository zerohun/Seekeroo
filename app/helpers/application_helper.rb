module ApplicationHelper

  def on_document_ready(scriptstring)
    generated_html = ""
    generated_html += "\n<script type='text/javascript'>"
    generated_html += "\n$(document).ready(function() {"
    generated_html += "\n#{scriptstring}"
    generated_html += "\n});"
    generated_html += "\n</script>"
    generated_html
  end

end

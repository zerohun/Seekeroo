module ApplicationHelper
  def image_preview(object_id, object_name, frame_src)

    content_tag(:div, :class => "image_preview",
                :id => "object_id", :name => "object_name") do

      htmltext = ""
      htmltext += javascript_include_tag 'iframeupload'

    end


  end

end

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

When /^I attach the file "([^"]*)" to "([^"]*)" in frame "([^"]*)"$/ do |path, field, frame| 
  within_frame(frame) do
    attach_file(field, File.expand_path(path))
  end
end


Then /^I should see the image file "([^"]*)" in "([^"]*)"$/ do |imagefile, div|

  if page.respond_to? :should
    page.should have_css(div + " > img[src]")
    image =  page.find(div).find("img")
    image_id = getImageID(page.find(div).find("img")[:src])
    image = Image.find_by_id!(image_id)
    fname = image.image_file_name
    assert fname == imagefile
  else
    assert page.has_css?(div + " > img[src]")
  end

end

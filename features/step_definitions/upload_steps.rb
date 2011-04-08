When /^I attach the file "([^"]*)" to "([^"]*)" in frame "([^"]*)"$/ do |path, field, frame| 
  within_frame(frame) do
    attach_file(field, File.expand_path(path))
  end
end


Then /^I should see the image file in div id "([^"]*)"$/ do |divid|

  if page.respond_to? :should
    targetxpath = "//div[@id='#{divid}']/img/attribute::src"
    page.should have_xpath(targetxpath)
  else
    assert page.has_xpath?(targetxpath)
  end

end

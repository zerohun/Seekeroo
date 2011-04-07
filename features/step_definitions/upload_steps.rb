When /^I attach the file "([^"]*)" to "([^"]*)" in frame "([^"]*)"$/ do |path, field, frame| 
  within_frame(frame) do
    attach_file(field, File.expand_path(path))
  end
end

Then /^(?:|I )should see image file/ do 
  if page.respond_to? :should
    targetxpath = "//img/attribute::src"
    page.should have_xpath(targetxpath)
  else
    assert page.has_xpath?(targetxpath)
  end
end

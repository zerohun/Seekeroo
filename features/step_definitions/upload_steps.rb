When /^I attach the file "([^"]*)" to "([^"]*)" in frame "([^"]*)"$/ do |path, field, frame| 
  within_frame(frame) do
    attach_file(field, File.expand_path(path))
  end
end


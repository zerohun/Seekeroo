Then /^I tag once$/ do
  image_view = page.find("div#image_view")
  target = page.find("div#subtitle_view")
  image_view.drag_to(target)
end


Then /^I tag once$/ do
  image_view = page.find("canvas")
  target = page.find("div#subtitle_view")
  image_view.drag_to(target)
end


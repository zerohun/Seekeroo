module ImageHelpers
  def getImageID(image_url)
    image_url[/images\/\d+/].sub(/images\//,"")
  end
end
World(ImageHelpers)

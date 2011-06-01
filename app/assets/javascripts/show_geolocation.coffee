@showGeolocation = ->
  geolocation = new Geolocation(0, 0)
  geolocation.loadFromHtml("map_canvas")
  geolocation.show("map_canvas")

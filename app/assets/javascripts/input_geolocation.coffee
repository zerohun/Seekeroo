error = (error)->
  



@inputGeolocation = ->
  if $("div#geolocation_fields").length > 0
    if navigator.geolocation
      geolocation = new Geolocation(0, 0)
      geolocation.getCurrentLocation((position)->
        
        $("input#article_latitude").val(position.coords.latitude)
        $("input#article_longitude").val(position.coords.longitude)
        geolocation.set(position.coords.latitude, position.coords.longitude)
        geolocation.show("editable_map_canvas")
        geolocation.enableEdit("editable_map_canvas")
      , error)


    else
      alert "do not support"


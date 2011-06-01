class @Geolocation
  constructor: (latitude, longitude)->
    @set(latitude, longitude)


  getCurrentLocation: (successCallback, errorCallback)->
    navigator.geolocation.getCurrentPosition(successCallback, errorCallback)

  set: (latitude, longitude)->
    @latitude = latitude
    @longitude = longitude

  getLatitude: ->
    return @latitude

  getLongitude: ->
    return @longitude

  loadFromHtml: (divid)->
    @latitude = $("##{divid}").data("latitude")
    @longitude = $("##{divid}").data("longitude")

  show: (divid)->
    if $("##{divid}").length > 0
      lating = new google.maps.LatLng(@latitude, @longitude)
      myOptions = {
        zoom: 15,
        center: lating,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      @map = new google.maps.Map(document.getElementById(divid), myOptions)
      @marker = new google.maps.Marker({
        position: lating
        map: @map
      })

  enableEdit: (divid)->
    if $("##{divid}").length > 0
      if @map && @marker
        marker = @marker
        google.maps.event.addListener(@map, 'click', (event)->
          clickedLocation = google.maps.LatLng(event.latLng)
          marker.setPosition(event.latLng)
          $("input#article_latitude").val(event.latLng.lat())
          $("input#article_longitude").val(event.latLng.lng())

        )




class @Rect
  constructor: (html_option, target)->
    @style = {}
    @html_option = html_option
    @div_id = @html_option["id"]
    @div_class = @html_option["class"]
    target.append("<div id=#{@div_id} class=#{@div_class}></div>")
    @hide()
    

  applyStyle: ()->
    for key, value of @style
      $("div##{@div_id}").css(key, value)
    $("div##{@div_id}").css("position", "absolute")

  setLocation: (x, y)->
    @style["left"] = x
    @style["top"] = y

  getLocation: ()->
    [@style["left"], @style["top"]]

  setSize: (width, height)->
    @style["width"] = width
    @style["height"] = height

  getSize: ()->
    [@style["width"], @style["height"]]

  setPoint: (startX, startY, endX, endY)->

    if startX < endX
      left = startX
      width = endX - startX
    else
      left = endX
      width = startX - endX

    if startY < endY
      top = startY
      height = endY - startY
    else
      top = endY
      height = startY - endY

    @style["left"] = left
    @style["top"] = top
    @style["width"] = width
    @style["height"] = height

    @applyStyle()

  show: ()->
    $("div##{@div_id}").css("visibility", "visible")
    @applyStyle()

  hide: ()->
    $("div##{@div_id}").css("visibility", "hidden")
    @applyStyle()

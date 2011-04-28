class TaggingPanel
  constructor: (panel, startButton, selectionBox)->
    @ismousedown = false
    $("body").append("<div id='debugbox'> </div>")

    startButton.click(()->
      panel.unbind('click')
      panel.mouseup((event)->
        @ismousedown = false 

        $("div#debugbox").text "up"

      ).mousedown((event)->
        @ismousedown = true
        @startX = event.pageX
        @startY = event.pageY
        $("div#debugbox").text "down"

      ).mousemove((event)->
        if @ismousedown
          endX = event.pageX
          endY = event.pageY
          selectionBox.setPoint(@startX, @startY, endX, endY)

      ).mouseleave((event)->
        @ismousedown = false
        $("div#debugbox").text "leave"
      )
    )



class Rect
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

$(document).ready(->

  ///^{ to prevent drag image in firefox  }///
  $("img#showimage").mousedown((event)->
    event.preventDefault()
  )
  size = {
    width: $("img#showimage").data("width")
    height: $("img#showimage").data("height")
  }

  $("div#image_view").css("width", size["width"])

  html_option = {
    id: "selection_rectangle",
    class: "selection_rectangle"
  }
  selectionRect = new Rect(html_option, $("div#image_view"))
  selectionRect.show()
  taggingPanel = new TaggingPanel($("div#image_view"),
                                  $("a#trigger_tag"),
                                  selectionRect)
)

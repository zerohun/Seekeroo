class @TaggingPanel
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

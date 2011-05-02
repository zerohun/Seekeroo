###
  have to envolve with Rect.coffee, TaggingPanel.coffee
###

createSubtitleField = ->

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

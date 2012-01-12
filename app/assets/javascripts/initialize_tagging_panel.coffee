requestNewTagboxForm = (sx, sy, ex ,ey)->

  if sx > ex
    left = ex
  else
    left = sx

  if sy > ey
    top = ey
  else
    top = sy

  width = ex - sx
  height = ey - sy
  if width < 0 
    width = -width
  if height < 0
    height = -height

  $.ajax({
    type: "GET"
    url: "#{location.href}/tagboxes/new"
    dataType: "script"
    data: "left=#{left}&top=#{top}&width=#{width}&height=#{height}"
  })
    

@initializeTaggingPanel = ->

  dataCanvas = getDataElementList("canvas", "taggable", true)
  startTaggingLink = getDataElementList("a", "start_tagging", true)
  endTaggingLink = getDataElementList("a", "done_tagging", true)
  if dataCanvas.length == 1 and startTaggingLink.length == 1 and endTaggingLink.length == 1 
    context = dataCanvas[0].getContext "2d"

    width = parseFloat($(dataCanvas).attr("width"))
    height = parseFloat($(dataCanvas).attr("height"))
    bgimage = new Image()
    subtitle_view = $("div#subtitle_view")
    page_view = $("div#page_view")

    tagboxmanager = new TagboxManager(context, width, height, bgimage)
    tagboxmanager.loadTagboxesFromHtml()

    bgimage.onload = ->
      tagboxmanager.refresh()

    bgimage.src = $(dataCanvas).data("imgsrc")

    $(startTaggingLink).click((event)->
      event.preventDefault()
      tagboxmanager.startDrawingMode()
    )
    $(endTaggingLink).click((event)->
      event.preventDefault()
      tagboxmanager.finishDrawingMode()
      tagboxmanager.refresh()
      $("div#tagbox_form").html("")

    )
    ismousedown = false
    startX = 0
    startY = 0
    endX = 0
    endY = 0
    $(dataCanvas).click((event)->
      if tagboxmanager.isDrawingMode() == false

        tagboxmanager.drawAll()

        tagbox = tagboxmanager.getClickedTagbox(event.pageX,
                                          event.pageY)
        tagbox.printSubtitles(subtitle_view, page_view, context)





    ).mousedown((event)->
      if tagboxmanager.contain(event.pageX, event.pageY) == false and tagboxmanager.isInsideOfPicture(event.pageX, event.pageY)
        ismousedown = true
        startX = event.pageX
        startY = event.pageY

    ).mouseup((event)->
      ismousedown = false

      if tagboxmanager.isDrawingMode() == true
        requestNewTagboxForm(startX, startY, endX, endY)
    ).mousemove((event)->
      if ismousedown
        endX = event.pageX
        endY = event.pageY
        if tagboxmanager.isLayered(startX, startY, endX, endY) == false and tagboxmanager.contain(endX, endY) == false and tagboxmanager.isInsideOfPicture(endX, endY)


          tagboxmanager.setSelectBox(startX,
                                     startY,
                                     endX,
                                     endY)
    ).mouseout((event)->

      if tagboxmanager.isDrawingMode && ismousedown
        requestNewTagboxForm(startX , startY, endX, endY)

      ismousedown = false
    )

requestNewTagboxForm = (sx, sy, ex ,ey)->
  left = sx
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
    width = parseFloat($(dataCanvas).data("width"))
    height = parseFloat($(dataCanvas).data("height"))
    bgimage = new Image()
    subtitle_view = $("div#subtitle_view")
    page_view = $("div#page_view")

    tagboxmanager = new TagboxManager(context, width, height, bgimage)
    tagboxmanager.loadTagboxesFromHtml()
    tagboxcreator = new TagboxCreator(context, width, height, bgimage, tagboxmanager)

    bgimage.onload = ->
      context.drawImage(bgimage, 0, 0)
      tagboxmanager.drawAll()
    bgimage.src = $(dataCanvas).data("imgsrc")

    $(startTaggingLink).click((event)->
      event.preventDefault()
      tagboxcreator.activate()
    )
    $(endTaggingLink).click((event)->
      event.preventDefault()
      tagboxcreator.deactivate()
      tagboxmanager.refresh()
    )
    ismousedown = false
    startX = 0
    startY = 0
    endX = 0
    endY = 0
    $(dataCanvas).click((event)->
      if tagboxcreator.isActivated() == false
        tagbox = tagboxmanager.getClickedTagbox(event.pageX,
                                          event.pageY)
        tagbox.printSubtitles(subtitle_view, page_view)

    ).mousedown((event)->
      if tagboxmanager.getClickedTagbox(event.pageX, event.pageY).getID() == tagboxmanager.getBackgroundTagbox().getID()
        ismousedown = true
        startX = event.pageX
        startY = event.pageY

    ).mouseup((event)->
      ismousedown = false

      if tagboxcreator.isActivated() == true
        requestNewTagboxForm(startX, startY, endX, endY)
    ).mousemove((event)->
      if ismousedown
        endX = event.pageX
        endY = event.pageY
        if tagboxmanager.getClickedTagbox(endX, endY).getID() == tagboxmanager.getBackgroundTagbox().getID() && !(tagboxmanager.isLayered(startX, startY, endX, endY))

          tagboxcreator.setSelectBox(startX,
                                     startY,
                                     endX,
                                     endY)
    ).mouseout((event)->

      if tagboxcreator.isActivated && ismousedown
        requestNewTagboxForm(startX, startY, endX, endY)

      ismousedown = false
    )

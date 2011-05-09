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
    

$(document).ready(->
  canvas = $("canvas#image_viewer")
  context = canvas[0].getContext "2d"
  width = parseFloat(canvas.data("width"))
  height = parseFloat(canvas.data("height"))
  bgimage = new Image()
  subtitle_view = $("div#subtitle_view")
  page_view = $("div#page_view")

  tagboxmanager = new TagboxManager(context, width, height, bgimage)
  tagboxmanager.loadTagboxesFromHtml()
  tagboxcreator = new TagboxCreator(context, width, height, bgimage)

  bgimage.onload = ->
    context.drawImage(bgimage, 0, 0)
    tagboxmanager.drawAll()
  bgimage.src = canvas.data("imgsrc")

  $("a#start_tagging").click((event)->
    event.preventDefault()
    tagboxcreator.activate()

  )
  $("a#done_tagging").click((event)->
    event.preventDefault()
    tagboxcreator.deactivate()
  )

  ismousedown = false
  startX = 0
  startY = 0
  endX = 0
  endY = 0
  canvas.click((event)->
    if tagboxcreator.isActivated() == false
      tagbox = tagboxmanager.getClickedTagbox(event.pageX,
                                            event.pageY)
      tagbox.printSubtitles(subtitle_view, page_view)


  ).mousedown((event)->
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

      tagboxcreator.setSelectBox(startX,
                                 startY,
                                 endX,
                                 endY)
  ).mouseout((event)->

    if tagboxcreator.isActivated && ismousedown
      requestNewTagboxForm(startX, startY, endX, endY)

    ismousedown = false
  )
 ) 

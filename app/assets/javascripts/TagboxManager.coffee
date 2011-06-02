class @TagboxManager
  constructor: (context, width, height, bgimage)->
    @context = context
    @width = width
    @height = height
    @bgimage = bgimage
    @tagboxlist = []
    @drawingmode = false
    @areaSelector = new AreaSelector(@context, 
                                    width, 
                                    height,
                                    bgimage)
  resetList: ->
    for tagbox in @tagboxlist
      @tagboxlist.pop()
    @tagboxlist = []

  startDrawingMode: ->
    @drawingmode = true

  finishDrawingMode: ->
    @drawingmode = false

  isDrawingMode: ->
    @drawingmode

  setSelectBox: (sx, sy, ex, ey)->
    if @drawingmode
      @refresh()
      if sx > ex
        temp = sx
        sx = ex
        ex = temp
      if sy > ey
        temp = sy
        sy = ey
        ey = temp

      @areaSelector.setBox(sx, sy, ex, ey)


  contain: (x, y)->
   @getClickedTagbox(x, y).getID() != @getBackgroundTagbox().getID() 



  addTagbox: (tagbox)->
    @tagboxlist.push tagbox
    tagbox.draw()


  removeTagbox: (tagbox)->
    count = 0
    for listed in @tagboxlist
      if listed.getID() == tagbox.getID()
        @tagboxlist.splice(count, 1)
      count++
    refresh()


  refresh: ->
    @resetList()
    @loadTagboxesFromHtml()
    @context.clearRect(0, 0, @width, @height)
    @context.drawImage(@bgimage,0 ,0)
    @drawAll()


  drawAll: ->
    tagbox.draw(@context) for tagbox in @tagboxlist

  loadTagboxesFromHtml: ->
    
    tagboxlist = []
    $("tagbox").each(->
      subtitles = new Subtitles()
      $(this).find("subtitle").each(->
        subtitles.addText($(this).data("text"))
      )
      sx = $(this).data("left")
      sy = $(this).data("top")
      ex = (parseFloat(sx) + parseFloat($(this).data("width"))).toString()
      ey = (parseFloat(sy) + parseFloat($(this).data("height"))).toString()
      id = $(this).attr("id")
      tagbox = new Tagbox(sx, sy, ex, ey, subtitles.deepCopy(),id)
      tagboxlist.push tagbox
    )
    @tagboxlist = @tagboxlist.concat(tagboxlist)

  getClickedTagbox: (x, y)->
    count = 0
    for tagbox in @tagboxlist
      if tagbox.contain(x, y) == true
        if count > 0
          return tagbox
        count++
    return @tagboxlist[0]

  getBackgroundTagbox: ->
    return @tagboxlist[0]

  isLayered: (sx, sy, ex, ey)->
    index = 0
    for tagbox in @tagboxlist
      if tagbox.isLayeredWith(sx, sy, ex ,ey) == true and index > 0
        return true
      index++

    return false

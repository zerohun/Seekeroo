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
    @context.fillStyle = "reg(0,0,0)"
    @context.fillRect(0, 0, @width, @height)
    @left = (@width - @bgimage.width)/2
    @top = (@height - @bgimage.height)/2
    @moveAll(@left, @top)

    @context.drawImage(@bgimage, @left, @top)
    @drawAll()

  moveAll: (left, top)->
    @tagboxlist[0].move(left,top)
#    tagbox.move(left, top) for tagbox in @tagboxlist

  drawAll: ->
    tagbox.draw(@context) for tagbox in @tagboxlist

  loadTagboxesFromHtml: ->
    
    tagboxlist = []
    $("tagbox").each(->
      subtitles = new Subtitles()
      $(this).find("subtitle").each(->
        subtitles.addText($(this).data("text"))
      )
      sx = parseFloat($(this).data("left"))
      sy = parseFloat($(this).data("top"))
      ex = sx + parseFloat($(this).data("width"))
      ey = sy + parseFloat($(this).data("height"))
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

  isInsideOfPicture: (left, top)->
    sx = @left
    ex = @left + @bgimage.width
    sy = @top
    ey = @top + @bgimage.height
    left >= sx && left <= ex && top >= sy && top <= ey

  getLeft: ->
    @left
  getTop: ->
    @top

  setContext: (context)->
    @context = context

class @TagboxManager
  constructor: (context, width, height, bgimage)->
    @context = context
    @width = width
    @height = height
    @bgimage = bgimage
    @tagboxlist = []
    @isactivated = false

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
        else 
          count++
    return @tagboxlist[0]

  getBackgroundTagbox: ->
    return @tagboxlist[0]

  isLayered: (sx, sy, ex, ey)->
    for tagbox in @tagboxlist
      if tagbox.isLayeredWith(sx, sy, ex ,ey)
        return true

    return false

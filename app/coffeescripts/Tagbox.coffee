class @Tagbox
  constructor: (sx, sy, ex, ey, subtitles, id)->
    @sx = sx
    @sy = sy
    @ex = ex
    @ey = ey
    @subtitles = subtitles
    @id = id
    @is_draw = false
    

  draw: (context)->
    width = @ex - @sx
    height = @ey - @sy
    context.strokeStyle = "grey"
    context.lineWidth = 5
    context.strokeRect(@sx, @sy, width, height)
    @is_draw = true

  isDraw: ->
    @is_draw

  isInside: (x, y)->
    x >= @sx && x <= @ex && y >= @sy && y <= @ey

  getID: ->
    @id

  printSubtitles: (subtitle_view, page_view)->
    @subtitles.print("next", subtitle_view, page_view)




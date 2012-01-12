class @Tagbox
  constructor: (sx, sy, ex, ey, subtitles, id)->
    @sx = sx
    @sy = sy
    @ex = ex
    @ey = ey
    @subtitles = subtitles
    @id = id
    @is_draw = false
    


  move: (left, top)->
    @sx = @sx + left
    @ex = @ex + left
    @sy = @sy + top
    @ey = @ey + top



  draw: (context)->
    width = @ex - @sx
    height = @ey - @sy
    context.strokeStyle = "grey"
    context.lineWidth = 5
    context.strokeRect(@sx, @sy, width, height)
    @is_draw = true

  isDraw: ->
    @is_draw

  contain: (x, y)->
    x > @sx + 10 && x < @ex + 10 && y > @sy + 10 && y < @ey + 10

  isLayeredWith: (sx, sy, ex, ey)->
    if sx > ex
      temp = sx
      sx = ex
      ex = temp

    if sy > ey
      temp = sy
      sy = ey
      ey = temp

    cx = (sx + ex)/2
    cy = (sy + ey)/2
    justbox = new Tagbox(sx, sy, ex, ey)
    justbox.contain(@sx, @sy) || justbox.contain(@sx, @ey) || justbox.contain(@ex, @sy) || justbox.contain(@ex, @ey) || @contain(cx,cy)


  getID: ->
    @id

  printSubtitles: (subtitle_view, page_view, context)->
    width = @ex - @sx
    height = @ey - @sy
    context.strokeStyle = "blue"
    context.lineWidth = 5
    context.strokeRect(@sx, @sy, width, height)
    @subtitles.print("next", subtitle_view, page_view)


  toHtml: ->
    "<tagbox  data-width='#{@ex - @sx}' data-height='#{@ey - @sy}' data-left='#{@sx}' data-top='#{@sy}' id='#{@id}' >
      <div id='subtitles'>
      " + @subtitles.toHtml() + "
      </div>
    </tagbox>"



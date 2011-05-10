class @AreaSelector

  constructor: (context, canvasWidth, canvasHeight, background)->
    @context = context
    @background = background
    @sx = 0
    @sy = 0
    @ex = 0
    @ey = 0
    @firstdrawing = true
    @lineWidth = 5
    @canvasWidth = canvasWidth
    @canvasHeight = canvasHeight
  
  setBox: (sx, sy, ex, ey)->
    @sx = sx
    @sy = sy
    @ex = ex
    @ey = ey
    if @firstdrawing == false
      @eraseBox()

    @context.strokeRect(sx, sy, ex - sx, ey - sy)
    @firstdrawing = false

  restoreBackground: (x, y, width, height)->
    @context.fillStyle = "red"
    @context.strokeWidth = 0
    @context.fillRect(x, y, width, height)
    ###
    @context.drawImage(@background, x, y, width, height)
    ###
                      

  eraseBox: ->

    @context.drawImage(@background, 0, 0)
    ###

    boxWidth = @ex - @sy
    boxHeight = @ey - @sy


    @restoreBackground(@sx - @lineWidth/2,
                      @sy - @lineWidth/2,
                      boxWidth + @lineWidth,
                      @lineWidth)

    @restoreBackground(@sx - @lineWidth/2,
                      @ey - @lineWidth/2, 
                      boxWidth + @lineWidth, 
                      @lineWidth)

    @restoreBackground(@sx - @lineWidth/2,
                      @sy - @lineWidth/2, 
                      @lineWidth, 
                      boxHeight + @lineWidth)

    @restoreBackground(@ex - @lineWidth/2,
                      @sy - @lineWidth/2, 
                      @lineWidth, 
                      boxHeight + @lineWidth)

    ### 


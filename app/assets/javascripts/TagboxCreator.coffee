class @TagboxCreator
  constructor: (context, canvasWidth, canvasHeight, bgimage, tagboxManager)->
    @context = context
    @isactivated = false
    @areaSelector = new AreaSelector(@context, 
                                    canvasWidth, 
                                    canvasHeight,
                                    bgimage,
                                    tagboxManager)


  setSelectBox: (sx, sy, ex, ey)->
    if @isactivated
      if sx > ex
        temp = sx
        sx = ex
        ex = temp
      if sy > ey
        temp = sy
        sy = ey
        ey = temp
      @areaSelector.setBox(sx, sy, ex, ey)

  createTagboxForm: (target)->
    

  activate: ->
    @isactivated = true

  deactivate: ->
    @isactivated = false

  isActivated: ->
    @isactivated


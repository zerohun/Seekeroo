class @TagboxCreator
  constructor: (context, canvasWidth, canvasHeight, bgimage)->
    @context = context
    @isactivated = false
    @areaSelector = new AreaSelector(@context, 
                                    canvasWidth, 
                                    canvasHeight,
                                    bgimage)


  setSelectBox: (sx, sy, ex, ey)->
    if @isactivated
      if sx > ex
        @swap(sx, ex)
      if sy > ey
        @swap(sy, ey)
      @areaSelector.setBox(sx, sy, ex, ey)

  createTagboxForm: (target)->
    

  activate: ->
    @isactivated = true

  deactivate: ->
    @isactivated = false

  isActivated: ->
    @isactivated

  swap: (a, b)->
    temp = a
    a = b
    b = temp

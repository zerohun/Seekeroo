class @TagboxDrawer
  constructor: (context)->
    @context = context
    @taggingmode = false
    @isactivated = false

  drawBox: (x, y, width, height)->
    if @isactivated
      strokeRect(x, y, width, height)

  activate: ->
    @isactivated = true

  deactivate: ->
    @isactivated = false

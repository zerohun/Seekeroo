class Subtitle
  constructor: ->
    @textlist = []
    @current = 0
    @size = 0

  addText: (textdata)->
    @textlist.push(textdata)
    @size = @size + 1

  getText: ->
    @textlist[@current]

  next: ->
    if @size < @current
      @current = @current + 1
    getText()

  reset: ->
    @current = 0

  prev: ->
    if @current > 0
      @current = @current - 1
      getText()


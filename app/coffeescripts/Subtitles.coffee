class @Subtitles
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
    if @size - 1 > @current
      @current = @current + 1
      text = @getText()
    else
      @current = -1
      text = ""
    text

  reset: ->
    @current = 0

  prev: ->
    if @current > 0
      @current = @current - 1
      @getText()

  pagecount: ->
    if @current == -1
      text = ""
    else
      text = "(#{@current+1}/#{@size})"
    text

  deepCopy: ->
    copied = new Subtitles()
    copied.addText(text) for text in @textlist
    copied

  print: (page, subtitle_view, page_view)->
    if(page == "current")
      subtitle_view.text(@getText())
      page_view.text(@pagecount())
    if(page == "next")
      subtitle_view.text(@next())
      page_view.text(@pagecount())


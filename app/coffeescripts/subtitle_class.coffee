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
    if @size - 1 > @current
      @current = @current + 1
    else
      @current = 0
    @getText()

  reset: ->
    @current = 0

  prev: ->
    if @current > 0
      @current = @current - 1
      @getText()

  pagecount: ->
    "(#{@current+1}/#{@size})"


$(document).ready( ->

  subtitles = new Subtitle()

  $("subtitle").filter((index)->
    subtitles.addText $("subtitle##{index}").data("text")
  )
  $("div#subtitle_view p").text(subtitles.getText())
  $("div#subtitle_page_count p").text(subtitles.pagecount())
  $("a#nextsubtitle").click( (event)->
    event.preventDefault()
    $("div#subtitle_view p").text(subtitles.next())
    $("div#subtitle_page_count p").text(subtitles.pagecount())
  )
)

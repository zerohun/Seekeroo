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


printSubtitle = (subtitle_list, page)->
  if(page == "current")
    $("div#subtitle_view p").text(subtitle_list.getText())
    $("div#subtitle_page_count p").text(subtitle_list.pagecount())
  if(page == "next")
    $("div#subtitle_view p").text(subtitle_list.next())
    $("div#subtitle_page_count p").text(subtitle_list.pagecount())
$(document).ready( ->
  
  subtitles = new Subtitle()
  $("subtitle").filter((index)->
    subtitles.addText $("subtitle##{index}").data("text")
  )
  printSubtitle(subtitles, "current")
  $("div#image_view").click((event)->
    event.preventDefault()
    printSubtitle(subtitles, "next")
  )
)

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
  $("a#nextsubtitle").click((event)->

    event.preventDefault()
    printSubtitle(subtitles, "next")
  )

  $("body").onselectstart = "return false;"
  $.fn.disableSelection = ->
    $(this).attr('unselectable', 'on').css('-moz-user-select', 'none').each(-> 
      this.onselectstart = ->
        return false
      )


  $("div#image_view").append("<div id='selected' class='selected'></div>")
  $("div#image_view").append("<div id='area_rectangle' class='area_rectangle'></div>")
  $("div#image_view").append("<div id='debugbox'></div>")

  image_width = $("img#view_image").css("width")
  image_height = $("img#view_image").css("height")

  ismousedown = false
  startX = 0
  startY = 0
  $("a#trigger_tag").click((event)->
    event.preventDefault()
    $("a#nextsubtitle").unbind('click')
    $("a#nextsubtitle").click((event)->
      $("div#selected").css("left", "#{event.pageX}px")
      $("div#selected").css("top", "#{event.pageY}px")
      $("div#selected").css("width", "100px")
      $("div#selected").css("height", "100px")
      $("div#debugbox").text("click")
    )

    $("div#image_view").mouseup((event)->
      ismousedown = false
      $("div#debugbox").text("up")
    ).mousedown((event)->
      ismousedown = true
      startX = event.pageX
      startY = event.pageY
      $("div#area_rectangle").css("left", "#{startX}px")
      $("div#area_rectangle").css("top", "#{startY}px")
      $("div#area_rectangle").css("width", "0px")
      $("div#area_rectangle").css("height", "0px")


      $("div#debugbox").text("down")
    )


    
    $("div#image_view").mousemove((event)->
      if ismousedown == true
        width = event.pageX - startX
        height = event.pageY - startY
        if width < 0
          $("div#area_rectangle").css("left", "#{event.pageX}px")
          $("div#area_rectangle").css("width", "#{-width}px")
        else
          $("div#area_rectangle").css("width", "#{width}px")

        if height < 0
          $("div#area_rectangle").css("top", "#{event.pageY}px")
          $("div#area_rectangle").css("height", "#{-height}px")
        else
          $("div#area_rectangle").css("height", "#{height}px")

        $("div#debugbox").text("width:#{width}  height:#{height}")
    )
  )
)

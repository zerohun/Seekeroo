class @Tagbox
  constructor: (param)->
    id = param["id"]
    @tagbox =  $("div.tagbox##{id}")
    @left = @tagbox.data("left")
    @top = @tagbox.data("top")
    @width = @tagbox.data("width")
    @height = @tagbox.data("height")
    @subtitles = param["subtitles"]
    @subtitle_view = param["subtitle_view"]
    @page_view = param["page_view"]
    @draw()
    @initClickEvent()

  draw: ->
    @tagbox.css("left", @left)
    @tagbox.css("top", @top)
    @tagbox.css("width", "#{@width}pt")
    @tagbox.css("height", "#{@height}pt")
    @tagbox.data("isDraw", "true")

  isDraw: ->
    result = false
    if $("div.tagbox##{@id}").data("isDraw") == "true"
      result = true
    result

  initClickEvent: ->
    subtitles = @subtitles
    subtitle_view = @subtitle_view
    page_view = @page_view
    @subtitles.print("next", @subtitle_view, @page_view)
    @tagbox.click((event)->
      event.preventDefault()
      subtitles.print("next", subtitle_view, page_view)
    )


$(document).ready( ->
  
  subtitles = new Subtitles()
  $("subtitle").filter((index)->
    subtitles.addText $("subtitle##{index}").data("text")
  )
  subtitle_view = $("div#subtitle_view p")
  page_view = $("div#subtitle_page_count p")
  $("div#image_view").click((event)->
    event.preventDefault()
    subtitles.printSubtitle("next", subtitle_view, page_view)
  )
)

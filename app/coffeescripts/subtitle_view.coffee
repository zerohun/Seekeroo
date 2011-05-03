
$(document).ready( ->
  
  number_of_tags = $("div.tagbox")
  tagboxes = []
  $("div.tagbox").each( ->
    subtitles = new Subtitles()
    $(this).find("subtitle").each(->
      subtitles.addText($(this).data("text"))
    )
    a = subtitles.deepCopy()
    tagboxobj = new Tagbox({
      id: $(this).attr("id"),
      subtitles: subtitles.deepCopy(),
      subtitle_view: $("div#subtitle_view p")
      page_view: $("div#page_view p")
    })
  )
)


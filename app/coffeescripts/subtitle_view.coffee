$(document).ready( ->

  subtitlelist = new SubtitleView()
  alert "its created"

  subtitlelist.addText text for text in $("subtitle")

  alert subtitlelist.getText()
  $("div#subtitle_view").text(subtitlelist.getText())
  $("a#nextsubtitle").click( (event)->
    event.preventDefault()
    $("div#subtitle_view").text(subtitlelist.next())
  )

)

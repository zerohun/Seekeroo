
renumberSubtitleFields =  ->

  $("div.field").each((index)->
    $(this).attr("id", index)
  )
  $("div.field label").each((index)->
    $(this).attr("for", "article_subtitles_attributes_#{index}_text")
    $(this).text("Subtitle #{index}")
  )
  $("div.field textarea").each((index)->
    $(this).attr("id", "article_subtitles_attributes_#{number}_text")
    $(this).attr("name", "article[subtitles_attributes][#{number}][text]")
  )



$(document).ready( ->
  $("a.remove_subtitle_field").click((event)->
    $(this).parent().remove()
    event.preventDefault()
  )

  $("a#add_subtitle_field").click((e)->
    number = $('div#subtitles div.field').length
    subtitleHTML = JST.subtitle_form number: number
    $('div#subtitles').append subtitleHTML
    e.preventDefault()
    $("a#remove_field_id_#{number}").click((event)->
      $(this).parent().remove() 
      event.preventDefault()
      renumberSubtitleFields()


    )

  )
)

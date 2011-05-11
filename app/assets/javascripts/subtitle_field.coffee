changeNameNumber = (target, index)->
  beforetext = target.attr("name")
  newtext = beforetext.replace("[subtitles_attributes][0]", 
                               "[subtitles_attributes][#{index}]")
  target.attr("name", newtext)

changeIDNumber = (target, index, attribute)->
  beforetext = target.attr(attribute)
  newtext = beforetext.replace("subtitles_attributes_0", 
                               "subtitles_attributes_#{index}")
  target.attr(attribute, newtext)

@duplicate = (target, index)->
  cloned = target.clone(true)
  changeIDNumber(cloned.find("label"), index, "for")
  changeIDNumber(cloned.find("textarea"), index, "id")
  changeNameNumber(cloned.find("textarea"), index)
  cloned.find("textarea").val("")
  cloned.find("label").text("Subtitle #{index + 1}")
  cloned.attr("id",index)
  cloned.appendTo target.parent()

@removeField = (buttonobj)->
  buttonobj.parent().remove()
  renumberSubtitleFields()

renumberSubtitleFields = ->
  $("div.subtitlefields").each((index)->
    $(this).attr("id", index)
  )
  $("label").each((index)->
    changeIDNumber($(this), index, "for")
    $(this).text("Subtitle #{index+1}")

  )
  $("textarea").each((index)->
    changeIDNumber($(this), index, "id")
    changeNameNumber($(this), index)
  )



@manageSubtitleFileds = ->
  if $("a.remove_subtitle_field").length > 0
    $("a.remove_subtitle_field").click((e)->
      e.preventDefault()
      removeField $(this)
    )
  if $("a#add_subtitle_field").length > 0
    $("a#add_subtitle_field").click((e)->
      e.preventDefault() 
      $("a#remove_field_id_#{number}").click((event)-> 
        event.preventDefault()
        removeField $(this)
      )
      number = $('div.subtitlefields').length
      duplicate($('div.subtitlefields#0'), number)
    )

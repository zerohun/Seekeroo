$(document).ready ->
  $("a.remove_subtitle_fields").click((event)->
    this.parent().remove()
    event.preventDefault()
    )

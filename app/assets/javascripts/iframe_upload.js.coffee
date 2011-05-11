@createUploadIframe = ->
  iframe = getDataElementList("iframe", "iframe_for_upload", true)
  selectFileButton = getDataElementList("button", "select_file", true)

  if iframe.length == 1 && selectFileButton.length == 1
    $(iframe).load(->
      $(iframe).contents().find("#image_image").change(->
        $(iframe).contents().find("input[type='submit']").trigger('click')
      )
      $(selectFileButton).click((event)->
        $(iframe).contents().find("#image_image").trigger('click')
      )
    )


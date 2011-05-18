@createUploadIframe = ->
  iframe = getDataElementList("iframe", "iframe_for_upload", true)
  selectFileButton = getDataElementList("button", "select_file", true)

  if iframe.length == 1 && selectFileButton.length == 1
    $(iframe).unbind('load').load(->
      $(iframe).contents().find("#image_image").unbind('change').change(->
        $(iframe).contents().find("input[type='submit']").trigger('click')
      )
      $(selectFileButton).unbind('click').click((event)->
        $(iframe).contents().find("#image_image").trigger('click')
      )
    )


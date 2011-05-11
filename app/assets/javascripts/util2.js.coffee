@getDataElementList = (elementName, dataName, dataValue)->
  elements = []
  $(elementName).each(->
    if $(this).data("#{dataName}") == dataValue
      elements.push(this)
    )
  elements


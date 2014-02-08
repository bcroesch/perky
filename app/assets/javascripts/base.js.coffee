$ ()->
  controller = $("body").data("controller")
  action = $("body").data("action")
  
  if PKY[controller]?
    instance = new PKY[controller]()
    instance["init"]() if typeof(instance["init"]) == "function"
    instance["init#{action}"]() if typeof(instance["init#{action}"]) == "function"
    PKY.instance = instance


  $('.delete-resource-button').click ()->
    url = @href
    resourceId = $(@).data('id')
    resourceName = $(@).data('name')
    bootbox.confirm $(@).data('confirm'), (result)->
      if result
        $.ajax
          url: url,
          type: 'DELETE'
         .error (jqXHR, status, err)->
            noty(layout: 'topRight', type: 'error', text: "There was an error deleting your #{resourceName}.");
         .success (data, status, jqXHR)->
            $("##{resourceName}_"+resourceId).hide()
            noty(layout: 'topRight', type: 'success', text: "The #{resourceName} was successfully deleted.");
    false
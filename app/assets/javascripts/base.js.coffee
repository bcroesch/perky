# Angular app
@app = angular.module "Perky", [
  "ngResource"
]

# Takes care of Angular and CSRF
@app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
  
$ ->
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

$ -> # Only runs for fresh/non-Turbolinked requests
  # Fades out any dismissable alert
  flashCallback = ->
    $(".alert-dismissable").fadeOut 2500

  setTimeout flashCallback, 2500

$(document).on "page:change", -> # Turbolinks => the page has been parsed and changed to the new version and on DOMContentLoaded
  if window._gaq?
    _gaq.push ["_trackPageview"]
  else pageTracker._trackPageview() if window.pageTracker?


$(document).on "page:load", -> # Turbolinks => is fired at the end of the loading process
  angular.bootstrap document.body, ["Perky"]
  eval $("#supportHelper").text()
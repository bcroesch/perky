#### Base JS Setup for Angular App

# Angular app
@app = angular.module "Perky", [
  "ngResource"
]


# Takes care of Angular and CSRF
@app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
  

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
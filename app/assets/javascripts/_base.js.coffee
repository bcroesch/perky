#### Base JS Setup for Angular App

# Angular app
@app = angular.module "Perky", [
  "ngResource"
]


# Takes care of Angular and CSRF
@app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
  

$(document).on "page:change", -> # Turbolinks => the page has been parsed and changed to the new version and on DOMContentLoaded
  if window._gaq?
    _gaq.push ["_trackPageview"]
  else pageTracker._trackPageview() if window.pageTracker?


$(document).on "page:load", -> # Turbolinks => is fired at the end of the loading process
  angular.bootstrap document.body, ["Spark"]
  eval $("#supportHelper").text()
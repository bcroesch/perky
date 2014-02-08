# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@PerksCtrl = ['$scope', ($scope) ->
  $scope.monthly_credits = jQuery('#monthly_credits').data('monthly')

  alert $scope.monthly_credits
]
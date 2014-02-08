# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@PerksCtrl = ['$scope', ($scope) ->
  $scope.monthly_credits = jQuery('#monthly_credits').data('monthly')
  $scope.remaining_credits = $scope.monthly_credits
  $scope.selected_perks = []

  $scope.selectPerk = (perk_id, credits) ->
    index = $scope.selected_perks.indexOf(perk_id)

    if index > -1
      $scope.monthly_credits = $scope.monthly_credits + credits
      $scope.selected_perks.splice(index, 1)
    else
      if $scope.monthly_credits > credits
        $scope.selected_perks.push perk_id
        $scope.monthly_credits = $scope.monthly_credits - credits

  $scope.isSelected = (perk_id) ->
    if $scope.selected_perks.indexOf(perk_id) > -1
      return {color: "green"}
    else
      return {color: "red"}

]
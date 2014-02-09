# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.factory "MakeSelection", [
  "$resource"
  ($resource) ->
    return $resource("/perk_selections", {},
      query:
        method: "POST"
        isArray: false
    )
]

app.factory "CancelSelection", [
  "$resource"
  ($resource) ->
    return $resource("/perk_selections/:id", {id: "@id"},
      query:
        method: "DELETE"
        isArray: false
    )
]


@PerksCtrl = [
  "$scope",
  "MakeSelection"
  "CancelSelection"
  ($scope, MakeSelection, CancelSelection) ->
    $scope.isSaving = false
    $scope.previous_selected = jQuery('#prior_selections').data('prior-selections')
    $scope.monthly_credits = jQuery('#monthly_credits').data('monthly')
    $scope.remaining_credits = $scope.monthly_credits

    $scope.selected_perks = []

    jQuery.each $scope.previous_selected, (k,v) ->
      $scope.selected_perks.push {selected_perk_id: v['id'], perk: v['perk_id'], }

    user_id = jQuery('#user').data('user-id')

    $scope.selectPerk = (perk_id, credits) ->
      index = -1
      found = false
      jQuery.each $scope.selected_perks, (k,v) ->
        if v['perk'] is perk_id
          found = true
          index = k

      $scope.isSaving = true

      if index > -1
        CancelSelection.query
          id: $scope.selected_perks[index]['selected_perk_id']
        , (res) ->
          if res['request'] is 'success'
            $scope.monthly_credits = $scope.monthly_credits + credits
            $scope.selected_perks.splice(index, 1)
          else
            alert "We were unable to unselect your perk."
        , () ->
          alert "We encountered an error while trying to unselect your perk."
      else
        if $scope.monthly_credits > credits
          MakeSelection.query
            user_id: user_id
            perk_id: perk_id
          , (res) ->
            if res['request'] is 'success'
              $scope.selected_perks.push {selected_perk_id: res['perk_selection_id'], perk: perk_id}
              $scope.monthly_credits = $scope.monthly_credits - credits
            else
              alert "We were unable to make your perk selection."
          , () ->
            alert "We encountered an error while trying to select your perk."

      $scope.isSaving = false

    $scope.isSelected = (perk_id) ->
      found = false
      jQuery.each $scope.selected_perks, (k,v) ->
        if v['perk'] is perk_id
          found = true

      if found is true
        return {color: "green"}
      else
        return {color: "red"}
]










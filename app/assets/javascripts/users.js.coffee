# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.factory "UpdateCredits", [
  "$resource"
  ($resource) ->
    return $resource("/users/:id", {id: "@id"},
      query:
        method: "PUT"
        isArray: false
    )
]

app.factory "DeleteUser", [
  "$resource"
  ($resource) ->
    return $resource("/users/:id", {id: "@id"},
      query:
        method: "DELETE"
        isArray: false
    )
]

@UsersCtrl = [
  "$scope"
  "UpdateCredits"
  "DeleteUser"
  ($scope, UpdateCredits, DeleteUser) ->
    $scope.edit_user = (user_id) ->
      jQuery('#user_' + user_id + '_edit').hide()
      jQuery('#user_' + user_id + '_monthly_spend_span').hide()
      jQuery('#user_' + user_id + '_update').show()
      jQuery('#user_' + user_id + '_monthly_spend_input').show()

    $scope.update_user = (user_id) ->
      # monthly_credits = jQuery('')

      # UpdateCredits.query
      #   id: user_id
      #   monthly_credits: monthly_credits
      # , (res) ->
        # if res['request'] is 'success'
          jQuery('#user_' + user_id + '_update').hide()
          jQuery('#user_' + user_id + '_monthly_credits_input').hide()
          jQuery('#user_' + user_id + '_edit').show()
          jQuery('#user_' + user_id + '_monthly_credits_span').show()
      #   else
      #     alert "We were unable to update this user."
      # , () ->
      #   alert "We encountered an error while trying to update this user."

    $scope.delete_user = (user_id) ->
      DeleteUser.query
        id: user_id
      , (res) ->
        if res['request'] is 'success'
          jQuery('#user_' + user_id + '_row').remove()
        else
          alert "We were unable to delete this user."
      , () ->
        alert "We encountered an error while trying to delete this user."
]
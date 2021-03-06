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

app.factory "AddUser", [
  "$resource"
  ($resource) ->
    return $resource("/accounts/:id/users.json", {id: "@id"},
      query:
        method: "POST"
        isArray: false
    )
]

@UsersCtrl = [
  "$scope"
  "$compile"
  "UpdateCredits"
  "DeleteUser"
  "AddUser"
  ($scope, $compile, UpdateCredits, DeleteUser, AddUser) ->
    $scope.credit_price = jQuery('#credit_price').data('credit-price')
    $scope.new_row = jQuery('#template').html()
    $scope.account_id = jQuery('#account_id').data('account-id')
    $scope.table = jQuery('#employees_table > tbody')

    $scope.new_employee = ->
      email = jQuery('.new_user_email').last().val()
      monthly = jQuery('.new_user_monthly').last().val()

      template = '<tr>' + jQuery('#employees_table > tbody').children().last().html() + '</tr>'

      AddUser.query
        id: $scope.account_id
        email: email
        monthly_credits: parseInt(monthly) / $scope.credit_price
      , (res) ->
        if res['request'] is 'success'
          jQuery('#account_total').text(String(res['account_total']))
          jQuery('#employee_total').text(String(res['employee_total']))

          jQuery('.new_user_email').last().hide()
          jQuery('.new_user_monthly').last().hide()
          jQuery('.new_user_add_btn').last().hide()
          jQuery('.new_user_confirm_btn').last().show()

          jQuery('.new_user_email_span').last().text(email)
          jQuery('.new_user_spend_span').last().text('$' + monthly)
          jQuery('.new_user_credits_span').last().text(String(parseInt(monthly) / $scope.credit_price))
        
          $scope.table.append(template)
          $compile(jQuery('#employees_table > tbody'))($scope)
        else
          alert "We were unable to add this user."
      , () ->
        alert "We encountered an error while trying to add this user."

    $scope.edit_user = (user_id) ->
      jQuery('#user_' + user_id + '_edit').hide()
      jQuery('#user_' + user_id + '_monthly_spend_span').hide()
      jQuery('#user_' + user_id + '_update').show()
      jQuery('#user_' + user_id + '_monthly_spend_input').show()
      jQuery('#user_' + user_id + '_monthly_spend_input').val(parseInt jQuery('#user_' + user_id + '_spend').text())

    $scope.update_user = (user_id) ->
      monthly_spend = parseInt jQuery('#user_' + user_id + '_monthly_spend_input').val()
      monthly_credits = monthly_spend / $scope.credit_price

      UpdateCredits.query
        id: user_id
        monthly_credits: monthly_credits
      , (res) ->
        if res['request'] is 'success'
          jQuery('#user_' + user_id + '_spend').html(String(monthly_spend))
          jQuery('#user_' + user_id + '_credits').html(String(monthly_credits))
          jQuery('#account_total').text(String(res['account_total']))
          jQuery('#user_' + user_id + '_update').hide()
          jQuery('#user_' + user_id + '_monthly_spend_input').hide()
          jQuery('#user_' + user_id + '_edit').show()
          jQuery('#user_' + user_id + '_monthly_spend_span').show()
        else
          alert "We were unable to update this user."
      , () ->
        alert "We encountered an error while trying to update this user."

    $scope.delete_user = (user_id) ->
      DeleteUser.query
        id: user_id
      , (res) ->
        if res['request'] is 'success'
          jQuery('#account_total').text(String(res['account_total']))
          jQuery('#employee_total').text(String(res['employee_total']))
          jQuery('#user_' + user_id + '_row').remove()
        else
          alert "We were unable to delete this user."
      , () ->
        alert "We encountered an error while trying to delete this user."
]

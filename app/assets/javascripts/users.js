Perky.controller('UsersTableCtrl', ['$scope','$http', function ($scope, $http) {

//  $scope.new_users = {name: ''; email: ''; monthly_credits: ''}

  $scope.account_id = $('#table-data').attr("data-account-id");

  $scope.users = $http.get('/account/'+ $scope.account_id +'/users').success(function(data) {
    $scope.users = data;
  });

}]);

/*

UsersTableCtrl = [
  "$scope",
  ($scope, UpdateCredits, DeleteUser) ->


    $(".userCreditChange").change(k,v)

    $scope.asdf = (perk_id, credits) ->
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
            $scope.remaining_credits = $scope.remaining_credits + credits
            $scope.selected_perks.splice(index, 1)
          else
            alert "We were unable to unselect your perk."
        , () ->
          alert "We encountered an error while trying to unselect your perk."
      else
        if $scope.remaining_credits >= credits
          MakeSelection.query
            user_id: user_id
            perk_id: perk_id
          , (res) ->
            if res['request'] is 'success'
              $scope.selected_perks.push {selected_perk_id: res['perk_selection_id'], perk: perk_id}
              $scope.remaining_credits = $scope.remaining_credits - credits
            else
              alert "We were unable to make your perk selection."
          , () ->
            alert "We encountered an error while trying to select your perk."

      $scope.isSaving = false

]

*/


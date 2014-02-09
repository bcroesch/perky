# Allow inline editing for <input>
app.directive "inlineEdit", ->
  restrict: "A"
  scope:
    content: "@"

  transclude: true
  template: "<span class=\"editing\" data-ng-transclude></span>"
  controller: ($scope, $element, $transclude) ->
    $transclude (clone) ->
      $scope.transcluded_content = clone[0].textContent.trim()

    $element.bind "click", ->
      $element.hide().after "<input type='text' value='" + $scope.transcluded_content + "' style='width: 50%' />"
      $element.next().focus().blur ->
        if $element.next().val().trim().length > 0
          $scope.transcluded_content = $element.next().val().trim()
          $element.html $scope.transcluded_content
          $element.next().hide()
          $element.show()
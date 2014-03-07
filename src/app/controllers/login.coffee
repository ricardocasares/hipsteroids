angular.module 'hipster'
.controller 'LoginCtrl', ($scope, loginSvc, $location) ->
  
  $scope.password = null
  $scope.email = null
  $scope.rememberMe = false

  $scope.login = ()->
    $scope.err = false
    loginSvc.login $scope.email, $scope.password, $scope.rememberMe, (err,user)->
      if err
        $scope.err = err.message

  $scope.logout = loginSvc.logout
angular.module 'hipster'
.controller 'LoginCtrl', ($scope, loginSvc, $location) ->
  
  $scope.password = null
  $scope.email = null
  $scope.rememberMe = false

  $scope.login = (provider)->
    $scope.err = false
    loginSvc.login provider, $scope.email, $scope.password, $scope.rememberMe, (err,user)->
      if err
        $scope.err = err.message

  $scope.logout = loginSvc.logout
angular.module 'hipster'
.controller 'LoginCtrl', ($scope, loginSvc, $location) ->
  
  $scope.email = null
  $scope.password = null
  $scope.confirm = null
  $scope.rememberMe = false
  $scope.signupMode = false

  $scope.login = (provider)->
    $scope.err = false
    loginSvc.login provider, $scope.email, $scope.password, $scope.rememberMe, (err,user)->
      if err
        $scope.err = err.message
  
  $scope.signup = ()->
    $scope.err = false
    loginSvc.signup $scope.email, $scope.password, (err,user)->
      if err
        $scope.err = err.message
      if user
        $scope.login 'password'

  $scope.toggleSignup = ()->
    if $scope.signupMode
      $scope.signupMode = false
    else
      $scope.signupMode = true

  $scope.logout = loginSvc.logout
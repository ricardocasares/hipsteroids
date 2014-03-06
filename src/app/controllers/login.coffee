angular.module 'hipster'
.controller 'LoginCtrl', ($scope, loginSvc, $location) ->
  
  $scope.password = null
  $scope.email = null

  $scope.login = ()->
    loginSvc.login $scope.email, $scope.password, (err,user)->
      console.log err
      console.log user

  $scope.logout = loginSvc.logout
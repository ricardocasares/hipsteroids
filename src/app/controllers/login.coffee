angular.module 'hipster'
.controller 'LoginCtrl', ($scope, simpleLogin, $location) ->
  
  $scope.pass = null
  $scope.err = null
  $scope.email = null
  $scope.confirm = null
  $scope.createMode = false
  $scope.user = null

  $scope.login = (service) ->
    simpleLogin.login service, (err) ->
      $scope.err = (if err then err + '' else null)

  $scope.loginPassword = (cb) ->
    $scope.err = null
    unless $scope.email
      $scope.err = 'Please enter an email address'
    else unless $scope.pass
      $scope.err = 'Please enter a password'
    else
      simpleLogin.loginPassword $scope.email, $scope.pass, (err, user) ->
        $scope.err = (if err then err + '' else null)
        cb user  if not err and cb

  $scope.logout = simpleLogin.logout
  
  $scope.createAccount = ->
    
    assertValidLoginAttempt = ->
      unless $scope.email
        $scope.err = 'Please enter an email address'
      else unless $scope.pass
        $scope.err = 'Please enter a password'
      else $scope.err = 'Passwords do not match'  if $scope.pass isnt $scope.confirm
      not $scope.err
    
    $scope.err = null
    if assertValidLoginAttempt()
      simpleLogin.createAccount $scope.email, $scope.pass, (err, user) ->
        if err
          $scope.err = (if err then err + '' else null)
          return
        else
          # must be logged in before I can write to my profile
          $scope.login ->
            simpleLogin.createProfile user.id, user.email
            $location.path '/account'
    return


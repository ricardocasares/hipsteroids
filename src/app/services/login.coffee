angular.module 'hipster.services.login', [
  'hipster.services.profile'
]
.factory 'loginSvc', [
  'angularFireAuth'
  'profileSvc'
  '$location'
  '$rootScope'
  (angularFireAuth, profileSvc, $location, $rootScope) ->
    return (
      login: (email, pass, redirect, callback) ->
        p = angularFireAuth.login('password',
          email: email
          password: pass
          rememberMe: true
        )
        p.then ((user) ->
          $location.path redirect  if redirect
          callback and callback(null, user)
          return
        ), callback
        return

      logout: (redirectPath) ->
        angularFireAuth.logout()
        $location.path redirectPath  if redirectPath
        return

      createAccount: (name, email, pass, callback) ->
        angularFireAuth._authClient.createUser email, pass, (err, user) ->
          if callback
            callback err, user
            $rootScope.$apply()
          return

        return

      createProfile: profileCreator
    )
]
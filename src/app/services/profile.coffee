angular.module 'hipster.services.profile', []
.factory 'profileSvc', [
  'Firebase'
  'FBURL'
  '$rootScope'
  (Firebase, FBURL, $rootScope) ->
    return (id, name, email, callback) ->
      new Firebase(FBURL).child('users/' + id).set
        email: email
        name: name
      , (err) ->
        if callback
          callback err
          $rootScope.$apply()
        return

      return
]
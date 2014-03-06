angular.module 'hipster', [
  'firebase'
  'hipster.services.firebaseref'
  'hipster.config'
]

.run (loginSvc)->
  loginSvc.init()

.service 'loginSvc', ($rootScope, $firebaseSimpleLogin, firebaseRef) ->
  auth = null
  return (
    
    init: ()->
      auth = $firebaseSimpleLogin firebaseRef.base()
      return auth
    
    login: (email,password, cb) ->
      auth.$login 'password',
        email: email
        password: password
      .then (user)->
        cb null,user
      , (error)->
        cb error, null
    
    logout: ()->
      auth.$logout()
  )
angular.module 'hipster', [
  'hipster.services.firebaseref'
  'hipster.config'
  'firebase'
]

.run (loginSvc)->
  loginSvc.init()

.service 'loginSvc', ($rootScope, $firebaseSimpleLogin, firebaseRef) ->
  auth = null
  return (
    
    init: ()->
      auth = $firebaseSimpleLogin firebaseRef.base()
      return auth
    
    login: (email,password, rememberMe, cb) ->
      auth.$login 'password',
        email: email
        password: password
        rememberMe: rememberMe
      .then (user)->
        cb null,user
      , (error)->
        cb error, null
    
    logout: ()->
      auth.$logout()
  )
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
    
    login: (provider, email, password, rememberMe, cb) ->
      
      user = (user)-> cb null,user
      error = (error)-> cb error, null

      if provider is 'password'
        auth.$login 'password',
          email: email
          password: password
          rememberMe: rememberMe
        .then user, error
      else 
        auth.$login provider
        .then user, error
    
    logout: ()->
      auth.$logout()
  )
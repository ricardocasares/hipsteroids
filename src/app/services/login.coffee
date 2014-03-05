angular.module 'hipster.login', [
  'firebase'
  'angularfire.firebase'
]

.run((simpleLogin) ->
  simpleLogin.init()
  return
)

.factory 'simpleLogin', ($rootScope, $firebaseSimpleLogin, firebaseRef, profileCreator, $timeout) ->
  
  assertAuth = ->
    throw new Error('Must call loginService.init() before using its methods')  if auth is null
    return
  auth = null

  init: ->
    auth = $firebaseSimpleLogin(firebaseRef())
    auth

  logout: ->
    assertAuth()
    auth.$logout()
    return

  login: (provider, callback) ->
    assertAuth()
    auth.$login(provider,
      rememberMe: true
    ).then ((user) ->
      if callback
        $timeout ->
          callback null, user
          return

      return
    ), callback
    return

  loginPassword: (email, pass, callback) ->
    assertAuth()
    auth.$login('password',
      email: email
      password: pass
      rememberMe: true
    ).then ((user) ->
      if callback
        $timeout ->
          callback null, user
          return

      return
    ), callback
    return

  changePassword: (opts) ->
    assertAuth()
    cb = opts.callback or ->

    if not opts.oldpass or not opts.newpass
      $timeout ->
        cb 'Please enter a password'
        return

    else if opts.newpass isnt opts.confirm
      $timeout ->
        cb 'Passwords do not match'
        return

    else
      auth.$changePassword(opts.email, opts.oldpass, opts.newpass).then (->
        cb null
        return
      ), cb
    return

  createAccount: (email, pass, callback) ->
    assertAuth()
    auth.$createUser(email, pass).then ((user) ->
      callback null, user
      return
    ), callback
    return

  createProfile: profileCreator

.factory 'profileCreator', (firebaseRef, $timeout) ->
  (id, email, callback) ->
    firstPartOfEmail = (email) ->
      ucfirst email.substr(0, email.indexOf('@')) or ''
    ucfirst = (str) ->
      str += ''
      f = str.charAt(0).toUpperCase()
      f + str.substr(1)
    firebaseRef('users/' + id).set
      email: email
      name: firstPartOfEmail(email)
    , (err) ->
      if callback
        $timeout ->
          callback err
          return

      return

    return

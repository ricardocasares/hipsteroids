angular.module 'hipster'
.directive "ngShowAuth", ($rootScope) ->
  getExpectedState = (scope, attr) ->
    expState = scope.$eval(attr)
    expState = attr  if typeof (expState) isnt "string" and not angular.isArray(expState)
    expState = expState.split(",")  if typeof (expState) is "string"
    expState
  inList = (needle, list) ->
    res = false
    angular.forEach list, (x) ->
      if x is needle
        res = true
        return true
      false

    res
  assertValidStates = (states) ->
    throw new Error("ng-show-auth directive must be login, logout, or error (you may use a comma-separated list)")  unless states.length
    angular.forEach states, (s) ->
      throw new Error("Invalid state \"" + s + "\" for ng-show-auth directive, must be one of login, logout, or error")  unless inList(s, [
        "login"
        "logout"
        "error"
      ])
      return

    true
  loginState = "logout"
  $rootScope.$on "$firebaseSimpleLogin:login", ->
    loginState = "login"
    return

  $rootScope.$on "$firebaseSimpleLogin:logout", ->
    loginState = "logout"
    return

  $rootScope.$on "$firebaseSimpleLogin:error", ->
    loginState = "error"
    return

  restrict: "A"
  link: (scope, el, attr) ->
    fn = ->
      show = inList(loginState, expState)
      setTimeout (->
        el.toggleClass "ng-cloak", not show
        return
      ), 0
      return
    expState = getExpectedState(scope, attr.ngShowAuth)
    assertValidStates expState
    fn()
    $rootScope.$on "$firebaseSimpleLogin:login", fn
    $rootScope.$on "$firebaseSimpleLogin:logout", fn
    $rootScope.$on "$firebaseSimpleLogin:error", fn
    return

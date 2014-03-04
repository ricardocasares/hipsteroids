angular.module 'hipster'
.factory 'firebaseFactory', (Firebase, FBURL) ->
  
  pathRef = (args) ->
    i = 0

    while i < args.length
      args[i] = pathRef(args[i])  if typeof (args[i]) is 'object'
      i++
    args.join '/'
  ->
    new Firebase(pathRef([FBURL].concat(Array::slice.call(arguments))))
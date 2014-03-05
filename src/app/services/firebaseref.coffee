angular.module 'hipster.services.firebaseref', []
.factory 'firebaseRef', [
  'FBURL'
  'Firebase'
  (FBURL, Firebase) ->
    return (
      path: (path)->
        new Firebase(FBURL + path)

      posts: ->
        new Firebase(FBURL + '/posts')

      users: ->
        new Firebase(FBURL + '/users')
    )
]
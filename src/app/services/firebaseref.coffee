angular.module 'hipster.services.firebaseref', []
.factory 'FireRef', [
  'FBURL'
  'Firebase'
  (FBURL, Firebase) ->
    return (
      posts: ->
        new Firebase(FBURL + '/posts')

      users: ->
        new Firebase(FBURL + '/users')
    )
]
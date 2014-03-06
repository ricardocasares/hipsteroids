angular.module 'hipster.services.firebaseref', []
.factory 'firebaseRef', [
  'FBURL'
  'Firebase'
  (FBURL, Firebase) ->
    return (
      
      base: ()->
        new Firebase(FBURL)

      posts: ->
        new Firebase(FBURL + '/posts')

      users: ->
        new Firebase(FBURL + '/users')
    )
]
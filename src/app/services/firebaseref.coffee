angular.module 'hipster'
.factory 'firebaseRef',
  (FBURL) ->
    return (
      
      base: ()->
        new Firebase(FBURL)

      posts: ->
        new Firebase(FBURL + '/posts')

      users: ->
        new Firebase(FBURL + '/users')
    )
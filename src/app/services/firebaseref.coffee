angular.module 'hipster.services.firebaseref', ['firebase']
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
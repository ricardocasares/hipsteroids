angular.module 'hipster.services.posts', [
  'hipster.services.firebaseref'
]
.factory 'Posts', [
  'angularFireCollection'
  'FireRef'
  (angularFireCollection, FireRef) ->
    return (
      collection: (cb) ->
        angularFireCollection FireRef.posts(), cb

      find: (postId) ->
        FireRef.posts().child '/' + postId

      create: (post) ->
        FireRef.posts().push(
          title: post.title
          body: post.body
        ).name()

      removePost: (postId) ->
        post = FireRef.posts().child('/' + postId)
        post.remove()
    )
]
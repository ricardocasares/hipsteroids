angular.module 'hipster.services.posts', [
  'hipster.services.firebaseref'
]
.factory 'Posts', [
  'angularFireCollection'
  'firebaseRef'
  (angularFireCollection, FireRef) ->
    return (
      collection: (cb) ->
        angularFireCollection firebaseRef.posts(), cb

      find: (postId) ->
        firebaseRef.posts().child '/' + postId

      create: (post) ->
        firebaseRef.posts().push(
          title: post.title
          body: post.body
        ).name()

      removePost: (postId) ->
        post = firebaseRef.posts().child('/' + postId)
        post.remove()
    )
]
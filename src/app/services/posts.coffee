angular.module 'hipster'
.service 'Posts', (firebaseRef) ->
    return (
      all: () ->
        firebaseRef.base()

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
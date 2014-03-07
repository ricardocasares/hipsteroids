angular.module 'hipster'

.run (Posts)->
  Posts.init()

.service 'Posts', (firebaseRef, $firebase) ->
    
    ref = null
    
    return (
      init: () ->
        ref = firebaseRef.posts()
        
      all: () ->
        $firebase(ref)

      find: (idx) ->
        $firebase(ref).$child(@getIndex(idx))

      save: (post) ->
        if post.idx?
          @update(post)
          return
        $firebase(ref).$add(
          title: post.title
          body: post.body
        )

      update: (post) ->
        idx = post.idx
        delete post.idx
        @find(idx).$update(post)

      remove: (idx) ->
        @find(idx).$remove()

      getIndex: (idx)->
        keys = @all().$getIndex()
        keys[idx]
    )
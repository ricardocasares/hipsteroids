angular.module 'hipster'
.service 'firebaseSync', ($firebase, firebaseFactory) ->
  
  (path, limit) ->
    ref = firebaseFactory(path)
    ref = ref.limit(limit) if limit
    $firebase ref
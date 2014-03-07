angular.module 'hipster'
.controller 'AdminPostsCtrl', ($scope, Posts)->

    $scope.posts = Posts.all()

    $scope.save = (post)->
      Posts.save(post)
      $scope.cancel()

    $scope.cancel = ()->
      $scope.new =
        idx: null 
        title: ''
        body: ''
      $scope.postForm.$setPristine()

    $scope.remove = (idx)->
      if idx is $scope.new.idx then $scope.cancel()
      Posts.remove(idx)

    $scope.update = (idx, post)->
      $scope.new = post
      angular.copy(post, $scope.original)
      $scope.new.idx = idx

      $scope.postForm.$setDirty()
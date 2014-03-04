angular.module 'hipster'
.controller 'PostsCtrl', [
  '$scope'
  'firebaseSync'
  'firebaseFactory'
  ($scope, firebaseSync, firebaseFactory)->

    $scope.posts = firebaseSync 'posts', 8

    $scope.new = 
      title: 'New post'
      body: 'Come on, add a post'

    $scope.savePost = ()->
      ref = firebaseFactory 'posts'
      ref.push $scope.new
      $scope.new = ''
]
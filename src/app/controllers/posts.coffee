angular.module 'hipster'
.controller 'PostsCtrl', ($scope)->

    $scope.posts = [
      {
        title: "This is a post"
        body: "And this is it's body"
      }
      {
        title: "This is another post"
        body: "And, you know what? this is it's body too"
      }
    ]

    $scope.new = 
      title: 'New post'
      body: 'Come on, add a post'

    $scope.savePost = (post)->
      $scope.posts.push angular.copy(post)
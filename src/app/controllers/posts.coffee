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
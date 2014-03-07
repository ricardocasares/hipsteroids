angular.module 'hipster'
.controller 'PostsCtrl', ($scope, Posts)->

    $scope.posts = Posts.all()
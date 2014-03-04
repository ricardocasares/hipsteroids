angular.module 'hipster'
.controller 'NavCtrl', ['$scope', '$location', ($scope, $location)->

  $scope.active = (path)->
    path is $location.path()
    
]
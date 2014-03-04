angular.module 'hipster'
.controller 'AboutCtrl', ['$scope', ($scope)->

  $scope.content = {
    title: "Hipster tools for building angular apps"
    body: "This project uses Coffee, Jade, Stylus, GulpJS, and Firebase as data backend"
  }
  
]
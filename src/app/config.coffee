angular.module 'hipster'
.constant 'loginRedirectPath', '/login'
.constant 'loginProviders', 'facebook,twitter,password'
.constant 'FBURL', 'https://hipsteroids.firebaseio.com'
.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/posts',
      templateUrl: 'views/posts.html'
      controller: 'PostsCtrl'
    .when '/about',
      templateUrl: 'views/about.html'
      controller: 'AboutCtrl'
    .otherwise redirectTo: '/posts'
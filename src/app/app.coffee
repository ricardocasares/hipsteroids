angular.module 'hipster.config', ['ngRoute','security']
.constant 'loginRedirectPath', '/login'
.constant 'FBURL', 'https://hipsteroids.firebaseio.com'
.constant 'FBURL', 'https://hipsteroids.firebaseio.com'
.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/posts.html'
    .when '/login',
      templateUrl: 'views/login.html'
    .when '/signup',
      templateUrl: 'views/signup.html'
    .when '/posts',
      templateUrl: 'views/posts.html'
    .when '/admin/posts',
      authRequired: true
      templateUrl: 'views/admin/posts.html'
    .when '/about',
      templateUrl: 'views/about.html'
    .otherwise redirectTo: '/'
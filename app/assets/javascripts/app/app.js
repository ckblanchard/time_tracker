var app = angular.module('timetracker', ['ngRoute',
  'timetracker.controllers',
  'timetracker.services']);

app.config(function($routeProvider) {
  $routeProvider.when('/', {
      templateUrl: '/templates/dashboard.html',
      controller: 'HomeController',
      resolve: {
        session: function(SessionService) {
          return SessionService.getCurrentUser();
        }
      }
    })
  .otherwise({ redirectTo: '/' })
});
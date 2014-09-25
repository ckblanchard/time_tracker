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
    .when('/clients', {
      templateUrl: '/templates/clients.html',
      controller: 'ClientsController',
      resolve: {
        session: function(SessionService) {
          return SessionService.getCurrentUser();
        },
        clients: function(ClientService) {
          return ClientService.getClients();
        }
      }
    })
    .when('/clients/:id', {
      templateUrl: '/templates/client.html',
      controller: 'ClientsController',
      resolve: {
        session: function(SessionService) {
          return SessionService.getCurrentUser();
        },
        client: function(ClientService) {
          return ClientService.getClient(id);
        }
    })
  .otherwise({ redirectTo: '/' })
});
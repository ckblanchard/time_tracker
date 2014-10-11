var app = angular.module('timetracker', 
  ['ngRoute',
    'ui.router',
    'timetracker.controllers',
    'timetracker.services',
    'timetracker.sessionService']);

app.config(function($stateProvider, $urlRouterProvider) {
  
  // default redirect route
  $urlRouterProvider.otherwise("/");

  // Application states
  $stateProvider
    .state('dashboard', {
      url: "/",
      templateUrl: "/templates/dashboard.html",
      controller: "HomeController",
      resolve: {
        session: function(SessionService) {
          return SessionService.getCurrentUser();
        }
      }
    });
});

// app.config(function($routeProvider) {
//   $routeProvider.when('/', {
//       templateUrl: '/templates/dashboard.html',
//       controller: 'HomeController',
//       resolve: {
//         session: function(SessionService) {
//           return SessionService.getCurrentUser();
//         }
//       }
//     })
//     .when('/clients', {
//       templateUrl: '/templates/clients.html',
//       controller: 'ClientsController',
//       resolve: {
//         session: function(SessionService) {
//           return SessionService.getCurrentUser();
//         },
//         allClients: function(ClientService) {
//           return ClientService.getClients();
//         }
//       }
//     })
//     .when('/clients/:id', {
//       templateUrl: '/templates/client.html',
//       controller: 'ClientsController',
//       resolve: {
//         session: function(SessionService) {
//           return SessionService.getCurrentUser();
//         },
//         clientById: function(ClientService, $route) {
//           // console.log("Resolving client #" + $route.current.params.id);
//           // console.log("route:", $route);
//           return ClientService.getClient($route.current.params.id);
//         }
//       }
//     })
//   .otherwise({ redirectTo: '/' })
// });
var app = angular.module('timetracker', 
  ['ngRoute',
    'ui.router',
    'timetracker.controllers',
    'timetracker.services',
    'timetracker.sessionService',
    'timetracker.jobsService']);

app.config(function($stateProvider, $urlRouterProvider, $locationProvider) {
  
  // default redirect route
  $urlRouterProvider.otherwise("/");

  // Application states
  $stateProvider
    .state('dashboard', {
      url: "",
      abstract: true,
      templateUrl: "/templates/dashboard.html",
      controller: "HomeController",
      resolve: {
        session: function(SessionService) {
          return SessionService.getCurrentUser();
        }
      }
    })

    .state('profile', {
      url: "/profile",
      templateUrl: "/templates/profile.html",
      controller: "ProfileController",
      resolve: {
        session: function(SessionService) {
          return SessionService.getCurrentUser();
        }
      }
    })

    .state('clients', {
      parent: 'dashboard',
      url: "/",
      templateUrl: "/templates/clients.html",
      controller: "ClientsController",
      resolve: {
        allClients: function(ClientService) {
          return ClientService.getClients();
        },
        allJobs: function(JobsService) {
          return JobsService.getJobs();
        }
      }
    })
    .state('clients.detail', {
      url: "/client/:id",
      templateUrl: "/templates/clients.detail.html",
      controller: "ClientsDetailController",
      resolve: {
        client: function(ClientService, $stateParams) {
          return ClientService.getClient($stateParams.id);
        }
      }
    })

    .state('clients.jobs', {
      url: "/jobs",
      templateUrl: "/templates/jobs.html",
      controller: "JobsController",
      resolve: {
        allJobs: function(JobsService) {
          return JobsService.getJobs();
        }
      }
    });

    $locationProvider.html5Mode(true);

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
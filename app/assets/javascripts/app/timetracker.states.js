angular.module('timetracker.states', ['ui.router'])

.config(function($stateProvider, $urlRouterProvider) {
  
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

    .state('entry', {
      parent: 'dashboard',
      url: "",
      templateUrl: "/templates/entry.html",
      controller: "EntryController",
      resolve: {
        allClients: function(ClientService) {
          return ClientService.getClients();
        },
        allJobs: function(JobsService) {
          return JobsService.getJobs();
        }
      }
    })
    .state('entry.new', {
      url: "/new",
      templateUrl: "/templates/entry.new.html",
      controller: "NewEntryController"
    })

    .state('clients', {
      parent: 'dashboard',
      url: "/clients",
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
      url: "/clients/:id",
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
    });

});
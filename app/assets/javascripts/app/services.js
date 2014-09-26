angular.module('timetracker.services', [])
  .factory('EntryService', function() {
    var service = {
      getEntries: function() {

      }
    }
  })
  .factory('SessionService', function($http, $q) {

    var service = {
      getCurrentUser: function() {
        if (service.isAuthenticated()) {
          return $q.when(service.currentUser);
        } else {
          return $http.get('/api/current_user')
          .then(function(response) {
            return service.currentUser = response.data;
          });
        }
      },
      currentUser: null,
      isAuthenticated: function() {
        return !!service.currentUser;
      }
    };

    return service;
  })
  .factory('ClientService', function($http) {

    var service = {
      allClients: [],
      onClient: null,
      getClients: function() {
        return $http.get('/api/v1/clients')
        .then(function(response) {
          return service.allClients = response.data;
        });
      },
      getClient: function(client) {
        console.log("getClient just called with param: " + client);
        return $http.get('/api/v1/clients/' + client)
        .then(function(response) {
          console.log(".then returns: " + response.data);
          return service.oneClient = response.data;
        });
      }
    };
    console.log("ClientService returns");
    console.log(service);
    return service;
  });


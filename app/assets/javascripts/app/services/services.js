angular.module('timetracker.services', [])
  .factory('EntryService', function() {
    var service = {
      getEntries: function() {

      }
    }
  })

  .factory('ClientService', function($http) {

    var service = {
      allClients: [],
      client: null,
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
          return service.client = response.data;
        });
      }
    };

    return service;
  });


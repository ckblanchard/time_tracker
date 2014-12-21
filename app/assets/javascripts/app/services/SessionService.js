angular.module('timetracker.services')
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
});
angular.module('timetracker.jobsService', [])
.factory('JobsService', function($http) {

  var service = {
    allJobs: [],

    getJobs: function() {
      return $http.get('/api/v1/jobs')
      .then(function(response) {
        return service.allJobs = response.data;
      })
    }
  };

  return service;
});
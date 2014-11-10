angular.module('timetracker')
.controller('EntryController', function($scope, $stateParams, allClients, ClientService, $state, allJobs, JobsService) {

  $scope.id = $stateParams.id
  $scope.clients = ClientService.allClients;
  $scope.selectedClient = null;

  $scope.jobs = JobsService.allJobs;
  $scope.selectedJob = null;
  $scope.jobOptions = [];

  $scope.loadClientJobs = function() {
    $scope.jobOptions = $scope.jobs.filter(function(el) {
      return el.client_id == $scope.selectedClient.id;
    });
    $state.go('entry.new');
    // console.log('selectedClient.id is', $scope.selectedClient.id);
    // $state.go('clients.detail', {id: $scope.selectedClient.id })
  };

})

.controller('NewEntryController', function($scope) {

});
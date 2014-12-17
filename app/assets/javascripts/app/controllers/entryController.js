angular.module('timetracker')
.controller('EntryController', function($scope, $stateParams, allClients, ClientService, $state, allJobs, JobsService) {

  $scope.id = $stateParams.id
  $scope.clients = ClientService.allClients;
  $scope.selectedClient = null;

  $scope.jobs = JobsService.allJobs;
  $scope.selectedJob = null;
  $scope.jobOptions = [];

  $scope.loadClientJobs = function(id) {
    if ($scope.selectedJob) {
      $scope.selectedJob = null;
    }
    $scope.jobOptions = $scope.jobs.filter(function(el) {
      return el.client_id == id; //$scope.selectedClient.id;
    });
    $state.go('entry.new');
  };

})

.controller('NewEntryController', function($scope) {
  $scope.data = {};
  $scope.data.outerStartTime = null;
  $scope.data.outerEndTime = null;

});
angular.module('timetracker')
.controller('JobsController', function($scope, allJobs, JobsService, $state) {

  $scope.jobs = allJobs;
  $scope.selectedJob = null;
  console.log('$scope.jobs = ', $scope.jobs);
});
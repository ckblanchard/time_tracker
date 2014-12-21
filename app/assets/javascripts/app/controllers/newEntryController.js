angular.module('timetracker.controllers')

.controller('NewEntryController', function($scope) {
  $scope.data = {};
  $scope.data.outerStartTime = null;
  $scope.data.outerEndTime = null;

});
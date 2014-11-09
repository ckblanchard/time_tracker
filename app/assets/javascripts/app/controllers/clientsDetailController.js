angular.module('timetracker')
.controller('ClientsDetailController', function($scope, client, ClientService) {
  $scope.client = client;
});
angular.module('timetracker.controllers')

.controller('ClientsDetailController', function($scope, client, ClientService) {
  $scope.client = client;
});
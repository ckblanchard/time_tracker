angular.module('timetracker')
.controller('ClientsController', function($scope, session, SessionService, ClientService) {
  $scope.user = session.user;
  $scope.clients = ClientService.allClients;
  $scope.client = ClientService.oneClient;
});
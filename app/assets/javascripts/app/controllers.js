angular.module('timetracker.controllers', [])
  .controller('HomeController', function($scope, session, SessionService) {
    $scope.user = session.user;
  })
//  .controller('JobsController', function($scope, session, SessionService) {
//    $scope.user = session.user;
//  })
  .controller('ClientsController', function($scope, session, SessionService, ClientService, $routeParams) {
    $scope.user = session.user;
    $scope.clients = ClientService.allClients;
    $scope.client = ClientService.getClient(id)
  });
//  .controller('ProfileController', function($scope, session, SessionService) {
//    $scope.user = session.user;
//  });
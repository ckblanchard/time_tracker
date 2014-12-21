angular.module('timetracker.controllers', [])

.controller('HomeController', function($scope, session, SessionService) {
  $scope.user = session.user;
});

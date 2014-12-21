angular.module('timetracker.controllers')
.controller('ProfileController', function($scope, session, SessionService) {
  $scope.user = session.user;
});
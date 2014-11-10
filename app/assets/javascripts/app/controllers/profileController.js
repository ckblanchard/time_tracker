angular.module('timetracker')
.controller('ProfileController', function($scope, session, SessionService) {
  $scope.user = session.user;
});
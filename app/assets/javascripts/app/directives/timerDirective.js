angular.module('timetracker.directives', [])
.directive('cbTimer', function($window){
  return {
    restrict: 'E',
    templateUrl: '/templates/directives/cbTimer.html',
    scope: {
      startTime: '=',
      endTime: '='
    },
    link: function(scope, element, attrs) {
      scope.stopButton = { disabled: true };
      scope.timerStart = function() {
        //$window.alert('clicked start');

        scope.stopButton.disabled = false;
        //var innerStartTime = Date.now();
        //scope.data.startTime = innerStartTime;
        scope.startTime = Date.now();
      }
      scope.timerStop = function() {
        //var innerEndTime = Date.now();
        //scope.data.endTime = innerEndTime;
        //$window.alert('clicked stop');
        scope.endTime = Date.now();
      }
    }
  };
});



  // return {
  //   restrict: 'A',
  //   link: function(scope, element) {
  //     element.mouseup(function(event) {
  //       event.preventDefault();
  //     });
  //     element.focus(function(){
  //       element.select();
  //     });
  //   }
  // };
angular.module('timetracker.directives', [])
.directive('cbTimer', function($window, $interval){
  return {
    restrict: 'E',
    templateUrl: '/templates/directives/cbTimer.html',
    scope: {
      startTime: '=',
      endTime: '='
    },
    link: function(scope, element, attrs) {

      var _timerInterval, 
          count = 0,
          clock = 0,
          finalTime = null,
          timer = element.find('p');

      console.log(timer);

      scope.stopButton = { disabled: true };
      scope.startButton = { disabled: false };

      scope.timerStart = function() {
        //var innerStartTime = Date.now();
        //scope.data.startTime = innerStartTime;
        scope.startTime = Date.now();
        scope.stopButton.disabled = false;
        _startTimer();
        scope.startButton.disabled = true;
      }

      scope.timerStop = function() {
        //var innerEndTime = Date.now();
        //scope.data.endTime = innerEndTime;
        //$window.alert('clicked stop');
        scope.endTime = Date.now();
        $interval.cancel(_timerInterval);
        scope.stopButton.disabled = true;
        timer.removeClass('active').addClass('done');
        timer.html(clock);
      }

      function _startTimer() {
        _timerInterval = $interval(function() {
          _counter();
        }, 1000)
      }

      function _counter() {
        count++;
        clock = _calculate_clock(count);
        timer.html(clock);
      }

      function _calculate_clock(count) {
        var hours = Math.floor(count/3600);
        var minutes = Math.floor((count - ( hours * 3600 )) / 60);
        var seconds = (count - (hours * 3600) - (minutes * 60)).toFixed();
        if (hours < 10) {
          hours = '0' + hours.toString();
        }
        if (minutes < 10) {
          minutes = '0' + minutes.toString();
        }
        if (seconds < 10) {
          seconds = '0' + seconds.toString();
        }
        return clock = hours + ':' + minutes + ':' + seconds;
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
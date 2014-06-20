// Generated by CoffeeScript 1.6.3
(function() {
  angular.module("Angustrap", []).service('CleanUp', [
    '$timeout', function($timeout) {
      return function(scope) {
        return $timeout(function() {
          var classes;
          if (scope.asId) {
            classes = $('#' + scope.asId).attr('class');
            return $('#' + scope.asId).attr('class', classes.trim());
          }
        }, 0);
      };
    }
  ]);

}).call(this);

/*
//@ sourceMappingURL=cleanup.map
*/

// Generated by CoffeeScript 1.6.3
(function() {
  directive("alert", [
    function() {
      var defObj;
      defObj = {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          theme: "@"
        },
        template: '<div class="alert alert-{{theme}}" role="alert" data-ng-transclude></div>'
      };
      return defObj;
    }
  ]);

}).call(this);

/*
//@ sourceMappingURL=alerts.map
*/

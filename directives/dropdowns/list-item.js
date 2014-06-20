// Generated by CoffeeScript 1.6.3
(function() {
  directive("listItem", [
    function() {
      var defObj;
      defObj = {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          asHref: "@asHref",
          asClick: "=asClick"
        },
        template: "<li role=\"presentation\">\n  <a role=\"menuitem\" tabindex=\"-1\" href=\"{{asHref}}\" data-ng-click=\"{{asClick}}\" data-ng-transclude></a>\n</li>"
      };
      return defObj;
    }
  ]);

}).call(this);

/*
//@ sourceMappingURL=list-item.map
*/

// Generated by CoffeeScript 1.7.1
(function() {
  angular.module("Angustrap").directive("navbarDropdown", function() {
    return {
      restrict: "E",
      replace: true,
      transclude: true,
      scope: {
        asId: "@asId",
        asClass: "@asClass",
        title: "@title"
      },
      controller: function($scope, CleanUp) {
        return CleanUp($scope);
      },
      template: "<li class=\"dropdown {{asClass}}\" id=\"{{asId}}\">\n    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">{{title}} <b class=\"caret\"></b></a>\n    <ul class=\"dropdown-menu\" data-ng-transclude></ul>\n</li>"
    };
  });

}).call(this);

//# sourceMappingURL=navbar-dropdown.map
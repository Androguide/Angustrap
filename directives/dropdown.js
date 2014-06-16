// Generated by CoffeeScript 1.6.3
(function() {
  angular.module('Angustrap').directive("dropdown", function() {
    var defObj;
    defObj = {
      restrict: "E",
      replace: true,
      transclude: true,
      templateUrl: "templates/dropdowns/dropdown.html",
      scope: {
        theme: "@theme",
        icon: "@icon",
        size: "@size",
        title: "@title",
        dropup: "@dropup",
        type: "@type"
      },
      link: {
        pre: function(scope) {
          if (scope.dropup) {
            scope.directionClass = "dropup";
          } else {
            scope.directionClass = "dropdown";
          }
          console.log("type: ", scope.type);
          if (scope.type === "split") {
            scope.isSplit = true;
            return scope.btnGroup = "btn-group";
          } else if (scope.type === "btn") {
            scope.isSplit = false;
            scope.srOnly = "";
            return scope.btnGroup = "";
          } else if (!scope.type) {
            scope.srOnly = "sr-only";
            scope.isSplit = false;
            return scope.btnGroup = "";
          }
        }
      }
    };
    return defObj;
  });

}).call(this);

/*
//@ sourceMappingURL=dropdown.map
*/

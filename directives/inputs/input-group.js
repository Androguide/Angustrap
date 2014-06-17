// Generated by CoffeeScript 1.7.1
(function() {
  angular.module("Angustrap").directive("inputGroup", function() {
    return {
      restrict: "E",
      replace: true,
      transclude: true,
      templateUrl: "templates/inputs/input-group.html",
      scope: {
        asId: "@asId",
        asClass: "@asClass",
        title: "@title",
        type: "@type",
        side: "@side",
        icon: "@icon",
        size: "@size",
        theme: "@theme",
        inputType: "@inputType"
      },
      controller: function($scope, CleanUp) {
        if (!!$scope.size) {
          $scope.sizeWildcard = "input-group-";
        }
        return CleanUp($scope);
      }
    };
  });

}).call(this);

//# sourceMappingURL=input-group.map

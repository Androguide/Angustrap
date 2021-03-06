// Generated by CoffeeScript 1.6.3
(function() {
  directive("navbar", [
    "AsRandom", function(AsRandom) {
      return {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          theme: "@",
          title: "@",
          titleHref: "@",
          fixed: "@",
          center: "="
        },
        template: '\
        <nav class="navbar navbar-{{theme}} {{fixedWildcard}}{{fixed}}" role="navigation">\
            <div class="{{container}}">\
                <div class="navbar-header">\
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="{{hashRandom}}">\
                        <span class="sr-only">Toggle navigation</span>\
                        <span class="icon-bar"></span>\
                        <span class="icon-bar"></span>\
                        <span class="icon-bar"></span>\
                    </button>\
                    <a class="navbar-brand" ng-href="{{titleHref}}">{{title}}</a>\
                </div>\
                <div class="collapse navbar-collapse" id="{{random}}">\
                    <div class="{{center && \'container\' || \'\'}}" data-ng-transclude></div>\
                </div>\
            </div>\
        </nav>',
        controller: [
          '$scope', '$timeout', 'CleanUp', function($scope, $timeout, CleanUp) {
            $scope.random = "#" + AsRandom(12);
            $scope.hashRandom = "#" + $scope.random;
            $scope.container = "container";
            if (!$scope.center) {
              $scope.container = "container-fluid";
            }
            if (!$scope.theme) {
              $scope.theme = "default";
            }
            if ($scope.fixed) {
              $scope.fixedWildcard = "navbar-fixed-";
            }
            if (!$scope.fixed || scope.fixed === "static") {
              $scope.fixedWildcard = "navbar-static-top";
            }
            return CleanUp($scope);
          }
        ]
      };
    }
  ]);

}).call(this);

/*
//@ sourceMappingURL=navbar.map
*/

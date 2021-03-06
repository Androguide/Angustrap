// Generated by CoffeeScript 1.6.3
(function() {
  directive("panel", [
    function() {
      var defObj;
      defObj = {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          theme: "@",
          title: "@",
          footer: "@"
        },
        template: '\
            <div class="panel panel-{{theme}}">\
              <div class="panel-heading" data-ng-hide="footer">\
                <h3 class="panel-title">{{title}}</h3>\
              </div>\
              <div class="panel-body" data-ng-transclude></div>\
              <div class="panel-footer" data-ng-show="footer">{{title}}</div>\
            </div>',
        controller: [
          '$scope', function($scope) {
            if (!$scope.theme) {
              return $scope.theme = "default";
            }
          }
        ],
        link: function(scope, el, attrs) {
          if (attrs.footer === "") {
            return attrs.footer = true;
          }
        }
      };
      return defObj;
    }
  ]);

}).call(this);

/*
//@ sourceMappingURL=panels.map
*/

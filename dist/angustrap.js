(function() {
  angular.module("Angustrap", []).service('AsRandom', [
    function() {
      return function(x) {
        var r, s;
        s = "";
        while (s.length < x && x > 0) {
          r = Math.random();
          s += (r < 0.1 ? ~~(r * 100) : String.fromCharCode(~~(r * 26) + (r > 0.5 ? 97 : 65)));
        }
        return s;
      };
    }
  ]).service('CleanUp', [
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
  ]).directive("dropdown", [
    function() {
      var defObj;
      defObj = {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          type: "@type",
          theme: "@theme",
          icon: "@icon",
          size: "@size",
          title: "@title",
          dropup: "=dropup",
          asClick: "=asClick"
        },
        template: "<div class=\"{{btnGroup}} {{directionClass}}\">\n    <button type=\"button\" class=\"btn btn-{{theme}} btn-{{size}}\" data-toggle=\"{{dataToggle}}\">\n        <glyph icon=\"{{icon}}\"></glyph> {{title}}\n        <span class=\"caret\" data-ng-hide=\"isSplit\"></span>\n    </button>\n    <button type=\"button\" class=\"btn btn-{{theme}} btn-{{size}} dropdown-toggle\" data-toggle=\"dropdown\" data-ng-show=\"isSplit\">\n        <span class=\"caret\"></span>\n        <span class=\"sr-only\" style=\"position: relative\"></span>\n    </button>\n    <ul class=\"dropdown-menu\" role=\"menu\" data-ng-transclude></ul>\n</div>",
        controller: [
          '$scope', 'CleanUp', function($scope, CleanUp) {
            if ($scope.dropup) {
              $scope.directionClass = "dropup";
            } else {
              $scope.directionClass = "dropdown";
            }
            if ($scope.type === "split") {
              $scope.isSplit = true;
              $scope.dataToggle = "";
              $scope.btnGroup = "btn-group";
            } else if ($scope.type === "btn" || !$scope.type) {
              $scope.isSplit = false;
              $scope.dataToggle = "dropdown";
              $scope.btnGroup = "";
            }
            return CleanUp($scope);
          }
        ]
      };
      return defObj;
    }
  ]).directive("listDivider", [
    function() {
      var defObj;
      defObj = {
        restrict: "E",
        replace: true,
        scope: {},
        template: "<li role=\"presentation\" class=\"divider\"></li>"
      };
      return defObj;
    }
  ]).directive("listItem", [
    function() {
      var defObj;
      defObj = {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          asHref: "@asHref"
        },
        template: "<li role=\"presentation\">\n  <a role=\"menuitem\" tabindex=\"-1\" href=\"{{asHref}}\" data-ng-transclude></a>\n</li>"
      };
      return defObj;
    }
  ]).directive("btnGlyph", [
    function($timeout) {
      var defObj;
      defObj = {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          icon: "@icon",
          theme: "@theme",
          size: "@size"
        },
        link: function(scope, el, attrs) {
          return attrs.theme = attrs.theme || "default";
        },
        template: "<button type=\"button\" class=\"btn btn-{{theme}} btn-{{size}}\">\n    <span class=\"glyphicon glyphicon-{{icon}}\"></span>\n    <span data-ng-transclude></span>\n</button>"
      };
      return defObj;
    }
  ]).directive("glyph", [
    function() {
      var defObj;
      defObj = {
        restrict: "E",
        replace: true,
        template: "<span class=\"glyphicon glyphicon-{{icon}}\"></span>",
        scope: {
          icon: "@icon"
        }
      };
      return defObj;
    }
  ]).directive("inputGroup", [
    function() {
      return {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          title: "@title",
          asType: "@asType",
          side: "@side",
          icon: "@icon",
          size: "@size",
          theme: "@theme",
          type: "@type"
        },
        controller: [
          '$scope', 'CleanUp', function($scope, CleanUp) {
            return CleanUp($scope);
          }
        ],
        template: "<div class=\"input-group {{sizeWildcard}}{{size}}\">\n    <!-- Left Span Add-on -->\n    <span class=\"input-group-addon\" data-ng-show=\"asType == 'span' && side == 'left'\">\n        <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n    </span>\n    <!-- Left Button Add-on -->\n    <span class=\"input-group-btn\" data-ng-show=\"asType == 'btn' && side == 'left'\">\n        <button class=\"btn btn-{{theme}}\" type=\"button\">\n            <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n        </button>\n    </span>\n\n    <!-- The input -->\n    <input type=\"{{type}}\" class=\"form-control\" placeholder=\"{{placeholder}}\">\n\n    <!-- Right Span Add-on -->\n    <span class=\"input-group-addon\" data-ng-show=\"asType == 'span' && side == 'right'\">\n        <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n    </span>\n    <!-- Right Button Add-on -->\n    <span class=\"input-group-btn\" data-ng-show=\"asType == 'btn' && side == 'right'\">\n        <button class=\"btn btn-{{theme}}\" type=\"button\">\n            <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n        </button>\n    </span>\n</div>"
      };
    }
  ]).directive("navbarDropdown", [
    function() {
      return {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          title: "@title"
        },
        template: "<li class=\"dropdown\">\n    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">{{title}} <b class=\"caret\"></b></a>\n    <ul class=\"dropdown-menu\" data-ng-transclude></ul>\n</li>"
      };
    }
  ]).directive("navbarList", [
    function() {
      return {
        restrict: "E",
        replace: true,
        transclude: true,
        template: "<ul class=\"nav navbar-nav {{wildcard}}{{side}}\" data-ng-transclude></ul>",
        scope: {
          side: "@side"
        },
        controller: [
          '$scope', 'CleanUp', function($scope, CleanUp) {
            if ($scope.side) {
              $scope.wildcard = "navbar-";
            } else {
              $scope.wildcard = "";
            }
            return CleanUp($scope);
          }
        ]
      };
    }
  ]).directive("navbar", [
    "AsRandom", function(AsRandom) {
      return {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          theme: "@theme",
          title: "@title",
          titleHref: "@titleHref",
          fixed: "@fixed",
          center: "=center"
        },
        template: "<nav class=\"navbar navbar-{{theme}} {{fixedWildcard}}{{fixed}}\" role=\"navigation\">\n    <div class=\"{{container}}\">\n        <div class=\"navbar-header\">\n            <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"{{hashRandom}}\">\n                <span class=\"sr-only\">Toggle navigation</span>\n                <span class=\"icon-bar\"></span>\n                <span class=\"icon-bar\"></span>\n                <span class=\"icon-bar\"></span>\n            </button>\n            <a class=\"navbar-brand\" ng-href=\"{{titleHref}}\">{{title}}</a>\n        </div>\n        <div class=\"collapse navbar-collapse\" id=\"{{random}}\">\n            <div class=\"{{center && 'container' || '' }}\" data-ng-transclude></div>\n        </div>\n    </div>\n</nav>",
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
  ]).directive("progressBar", [
    function() {
      return {
        restrict: "E",
        transclude: false,
        replace: true,
        scope: {
          theme: "@",
          currValue: "@",
          minValue: "@",
          maxValue: "@",
          asTitle: "@"
        },
        template: "<div class=\"progress\">\n  <div class=\"progress-bar progress-bar-{{theme}}\" role=\"progressbar\" aria-valuenow=\"{{currValue}}\" aria-valuemin=\"{{minValue}}\" aria-valuemax=\"{{maxValue}}\" style=\"width: {{currValue}}%\">\n    <span class=\"sr-only\">{{asTitle}}</span>\n  </div>\n</div>"
      };
    }
  ]);

}).call(this);

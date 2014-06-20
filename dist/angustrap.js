(function() {
  angular.module("Angustrap", []).directive("btnDropdown", function() {
    var defObj;
    defObj = {
      restrict: "E",
      replace: true,
      transclude: true,
      template: "<div class=\"{{btnGroup}} {{directionClass}}\">\n  <button class=\"btn btn-{{theme}} btn-{{size}}\" type=\"button\" data-toggle=\"dropdown\">\n      <glyph icon=\"{{icon}}\"></glyph> {{title}}\n    <span class=\"caret\"></span>\n  </button>\n  <ul class=\"dropdown-menu\" role=\"menu\" aria-labelledby=\"{{id}}\" data-ng-transclude></ul>\n</div>",
      scope: {
        theme: "@theme",
        size: "@size",
        title: "@title",
        dropup: "=dropup"
      },
      link: function(scope, el, attrs) {
        attrs.theme = attrs.theme || "default";
        if (scope.dropup) {
          scope.directionClass = "dropup";
        }
        console.e("The <btn-dropdown> directive is now deprecated. Please use <dropdown type='btn'> instead");
      }
    };
    return defObj;
  });

  angustrap.module("Angustrap", []).directive("listDivider", [
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
  ]);

  angular.module("Angustrap", []).directive("dropdown", [
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
  ]);

  angular.module("Angustrap", []).directive("listItem", [
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
  ]);

  angular.module("Angustrap", []).directive("splitDropdown", function() {
    var defObj;
    defObj = {
      restrict: "E",
      replace: true,
      transclude: true,
      template: "<div class=\"btn-group {{directionClass}}\">\n    <button type=\"button\" class=\"btn btn-{{theme}}\">\n        <glyph icon=\"{{icon}}\"></glyph> {{title}}\n    </button>\n    <button type=\"button\" class=\"btn btn-{{theme}} dropdown-toggle\" data-toggle=\"dropdown\">\n        <span class=\"caret\"></span>\n        <span class=\"sr-only\" style=\"position: relative\"></span>\n    </button>\n    <ul class=\"dropdown-menu\" role=\"menu\" data-ng-transclude></ul>\n</div>",
      scope: {
        theme: "@theme",
        icon: "@icon",
        size: "@size",
        title: "@title",
        dropup: "=dropup"
      },
      link: function(scope, el, attrs) {
        attrs.theme = attrs.theme || "default";
        if (scope.dropup) {
          scope.directionClass = "dropup";
        }
        console.e("The <split-dropdown> directive is now deprecated. Please use <dropdown type='split'> instead");
      }
    };
    return defObj;
  });

  angular.module("Angustrap", []).directive("btnGlyph", [
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
  ]);

  angular.module("Angustrap", []).directive("glyph", [
    function() {
      var defObj;
      defObj = {
        restrict: "E",
        replace: window.replace,
        template: "<span id=\"{{asId}}\" class=\"glyphicon glyphicon-{{icon}} {{asClass}}\"></span>",
        scope: {
          icon: "@icon",
          asId: "@asId",
          asClass: "@asClass"
        }
      };
      return defObj;
    }
  ]);

  angular.module("Angustrap", []).directive("inputGroup", [
    function() {
      return {
        restrict: "E",
        replace: true,
        transclude: true,
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
        controller: [
          '$scope', 'CleanUp', function($scope, CleanUp) {
            return CleanUp($scope);
          }
        ],
        template: "<div id=\"{{asId}}\" class=\"input-group {{sizeWildcard}}{{size}} {{asClass}}\">\n    <!-- Left Span Add-on -->\n    <span class=\"input-group-addon\" data-ng-show=\"type == 'span' && side == 'left'\">\n        <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n    </span>\n    <!-- Left Button Add-on -->\n    <span class=\"input-group-btn\" data-ng-show=\"type == 'btn' && side == 'left'\">\n        <button class=\"btn btn-{{theme}}\" type=\"button\">\n            <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n        </button>\n    </span>\n\n    <!-- The input -->\n    <input type=\"{{inputType}}\" class=\"form-control\" placeholder=\"{{placeholder}}\">\n\n    <!-- Right Span Add-on -->\n    <span class=\"input-group-addon\" data-ng-show=\"type == 'span' && side == 'right'\">\n        <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n    </span>\n    <!-- Right Button Add-on -->\n    <span class=\"input-group-btn\" data-ng-show=\"type == 'btn' && side == 'right'\">\n        <button class=\"btn btn-{{theme}}\" type=\"button\">\n            <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n        </button>\n    </span>\n</div>"
      };
    }
  ]);

  angular.module("Angustrap", []).directive("navbarDropdown", [
    function() {
      return {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          asId: "@asId",
          asClass: "@asClass",
          title: "@title"
        },
        controller: [
          '$scope', 'CleanUp', function($scope, CleanUp) {
            return CleanUp($scope);
          }
        ],
        template: "<li class=\"dropdown {{asClass}}\" id=\"{{asId}}\">\n    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">{{title}} <b class=\"caret\"></b></a>\n    <ul class=\"dropdown-menu\" data-ng-transclude></ul>\n</li>"
      };
    }
  ]);

  angular.module("Angustrap", []).directive("navbarList", [
    function() {
      return {
        restrict: "E",
        replace: true,
        transclude: true,
        template: "<ul class=\"nav navbar-nav {{wildcard}}{{side}}\" data-ng-transclude></ul>",
        scope: {
          asId: "@asId",
          asClass: "@asClass",
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
  ]);

  angular.module("Angustrap", []).directive("navbar", [
    "AsRandom", function(AsRandom) {
      return {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          asId: "@asId",
          asClass: "@asClass",
          theme: "@theme",
          title: "@title",
          titleHref: "@titleHref",
          fixed: "@fixed",
          center: "=center"
        },
        template: "<nav id=\"{{asId}}\" class=\"navbar navbar-{{theme}} {{fixedWildcard}}{{fixed}} {{asClass}}\" role=\"navigation\">\n    <div class=\"{{container}}\">\n        <div class=\"navbar-header\">\n            <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"{{hashRandom}}\">\n                <span class=\"sr-only\">Toggle navigation</span>\n                <span class=\"icon-bar\"></span>\n                <span class=\"icon-bar\"></span>\n                <span class=\"icon-bar\"></span>\n            </button>\n            <a class=\"navbar-brand\" ng-href=\"{{titleHref}}\">{{title}}</a>\n        </div>\n        <div class=\"collapse navbar-collapse\" id=\"{{random}}\">\n            <div class=\"{{center && 'container' || '' }}\" data-ng-transclude></div>\n        </div>\n    </div>\n</nav>",
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

  (function() {
    var e, n, r, t;
    r = function(t) {
      return function(r, i) {
        return e.log("%c" + r, i + ";color:#fff;background:" + n[1][t]);
      };
    };
    e = console;
    t = 3;
    n = [["e", "s", "i"], ["#c0392b", "#2ecc71", "#3498db"]];
    while (t--) {
      e[n[0][t]] = r(t);
    }
  })();

}).call(this);

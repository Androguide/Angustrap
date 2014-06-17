// Generated by CoffeeScript 1.7.1
(function() {
  window.replace = false;

  angular.module("Angustrap", []).service('AsRandom', function() {
    return function(x) {
      var r, s;
      s = "";
      while (s.length < x && x > 0) {
        r = Math.random();
        s += (r < 0.1 ? Math.floor(r * 100) : String.fromCharCode(Math.floor(r * 26) + (r > 0.5 ? 97 : 65)));
      }
      return s;
    };
  }).service('CleanUp', function($timeout) {
    return function(scope) {
      return $timeout(function() {
        var classes;
        if (scope.asId) {
          classes = $('#' + scope.asId).attr('class');
          return $('#' + scope.asId).attr('class', classes.trim());
        }
      }, 0);
    };
  }).directive("glyph", function() {
    var defObj;
    defObj = {
      restrict: "E",
      replace: true,
      template: "<span id=\"{{asId}}\" class=\"glyphicon glyphicon-{{icon}} {{asClass}}\"></span>",
      scope: {
        icon: "@icon",
        asId: "@asId",
        asClass: "@asClass"
      }
    };
    return defObj;
  }).directive("btnGlyph", function($timeout) {
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
  }).directive("listItem", function() {
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
  }).directive("listDivider", function() {
    var defObj;
    defObj = {
      restrict: "E",
      replace: true,
      scope: {},
      template: "<li role=\"presentation\" class=\"divider\"></li>"
    };
    return defObj;
  }).directive("dropdown", function() {
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
      template: "<div class=\"{{btnGroup}} {{directionClass}}\" id=\"\">\n    <button type=\"button\" class=\"btn btn-{{theme}} {{srOnly}}\" data-toggle=\"{{isSplit && '' || 'dropdown' }}\">\n        <glyph icon=\"{{icon}}\"></glyph> {{title}}\n        <span class=\"caret\" data-ng-hide=\"isSplit\"></span>\n    </button>\n    <button type=\"button\" class=\"btn btn-{{theme}} dropdown-toggle\" data-toggle=\"dropdown\" data-ng-show=\"isSplit\">\n        <span class=\"caret\"></span>\n        <span class=\"sr-only\" style=\"position: relative\"></span>\n    </button>\n    <ul class=\"dropdown-menu\" role=\"menu\" data-ng-transclude></ul>\n</div>",
      link: {
        pre: function(scope) {
          if (scope.dropup) {
            scope.directionClass = "dropup";
          } else {
            scope.directionClass = "dropdown";
          }
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
  }).directive("navbar", [
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
        controller: function($scope, $timeout, CleanUp) {
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
      };
    }
  ]).directive("navbarList", function() {
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
      controller: function($scope, CleanUp) {
        if ($scope.side) {
          $scope.wildcard = "navbar-";
        } else {
          $scope.wildcard = "";
        }
        return CleanUp($scope);
      }
    };
  }).directive("navbarDropdown", function() {
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
  }).directive("inputGroup", function() {
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
      controller: function($scope, CleanUp) {
        if (!!$scope.size) {
          $scope.sizeWildcard = "input-group-";
        }
        return CleanUp($scope);
      },
      template: "<div id=\"{{asId}}\" class=\"input-group {{sizeWildcard}}{{size}} {{asClass}}\">\n    <!-- Left Span Add-on -->\n    <span class=\"input-group-addon\" data-ng-show=\"type == 'span' && side == 'left'\">\n        <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n    </span>\n    <!-- Left Button Add-on -->\n    <span class=\"input-group-btn\" data-ng-show=\"type == 'btn' && side == 'left'\">\n        <button class=\"btn btn-{{theme}}\" type=\"button\">\n            <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n        </button>\n    </span>\n\n    <!-- The input -->\n    <input type=\"{{inputType}}\" class=\"form-control\" placeholder=\"{{placeholder}}\">\n\n    <!-- Right Span Add-on -->\n    <span class=\"input-group-addon\" data-ng-show=\"type == 'span' && side == 'right'\">\n        <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n    </span>\n    <!-- Right Button Add-on -->\n    <span class=\"input-group-btn\" data-ng-show=\"type == 'btn' && side == 'right'\">\n        <button class=\"btn btn-{{theme}}\" type=\"button\">\n            <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n        </button>\n    </span>\n</div>"
    };
  });

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

//# sourceMappingURL=angustrap.map

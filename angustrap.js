// Generated by CoffeeScript 1.7.1
(function() {
  (function() {
    var e, n, r, t;
    r = function(t) {
      return function(r, i) {
        e.log("%c" + r, i + ";color:#fff;background:" + n[1][t]);
      };
    };
    e = console;
    t = 3;
    n = [["e", "s", "i"], ["#c0392b", "#2ecc71", "#3498db"]];
    while (t--) {
      e[n[0][t]] = r(t);
    }
  })();

  angular.module("Angustrap", []).directive("glyph", function() {
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
  }).directive("btnGlyph", function($timeout) {
    var defObj;
    defObj = {
      restrict: "E",
      replace: true,
      transclude: true,
      templateUrl: "templates/dropdowns/btn-glyph.html",
      scope: {
        icon: "@icon",
        theme: "@theme",
        size: "@size"
      },
      link: function(scope, el, attrs) {
        console.log(el);
        return attrs.theme = attrs.theme || "default";
      }
    };
    return defObj;
  }).directive("dropdownItem", function() {
    var defObj;
    defObj = {
      restrict: "E",
      replace: true,
      transclude: true,
      templateUrl: "templates/dropdowns/dropdown-item.html",
      scope: {
        asHref: "@asHref"
      }
    };
    return defObj;
  }).directive("dropdownDivider", function() {
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
      templateUrl: "templates/dropdowns/dropdown.html",
      scope: {
        type: "@type",
        theme: "@theme",
        icon: "@icon",
        size: "@size",
        title: "@title",
        dropup: "=dropup",
        asClick: "=asClick"
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
  }).directive("btnDropdown", function() {
    var defObj;
    defObj = {
      restrict: "E",
      replace: true,
      transclude: true,
      templateUrl: "templates/dropdowns/btn-dropdown.html",
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
  }).directive("splitDropdown", function() {
    var defObj;
    defObj = {
      restrict: "E",
      replace: true,
      transclude: true,
      templateUrl: "templates/dropdowns/split-dropdown.html",
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

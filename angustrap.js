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
        if (typeof attrs.theme === "undefined" || attrs.theme === "") {
          return attrs.theme = "default";
        }
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
        asId: "@asId"
      }
    };
    return defObj;
  }).directive("btnDropdown", function($timeout) {
    var defObj;
    defObj = {
      restrict: "E",
      replace: true,
      transclude: true,
      templateUrl: "templates/dropdowns/btn-dropdown.html",
      scope: {
        asId: "@asId",
        theme: "@theme",
        size: "@size",
        title: "@title"
      },
      link: function(scope, el, attrs) {
        var handleSize;
        if (typeof attrs.asId === "undefined" || attrs.asId === "") {
          console.e('Angustrap: ERROR - You must define an ID for this dropdown, using the `as-id="yourId"` attribute');
          el.remove();
          return;
        }
        if (typeof attrs.theme === "undefined" || attrs.theme === "") {
          attrs.theme = "default";
        }
        handleSize = function() {
          if (typeof attrs.size === "undefined" || attrs.size === "") {
            angular.element("#" + attrs.asId).removeClass("btn-");
          }
        };
        $timeout(handleSize, 0);
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
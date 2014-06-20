// Generated by CoffeeScript 1.6.3
(function() {
  directive("btnGlyph", [
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

}).call(this);

/*
//@ sourceMappingURL=btn-glyph.map
*/

// Generated by CoffeeScript 1.6.3
(function() {
  directive("inputGroup", [
    function() {
      return {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          asId: "@asId",
          asClass: "@asClass",
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
        template: "<div id=\"{{asId}}\" class=\"input-group {{sizeWildcard}}{{size}} {{asClass}}\">\n    <!-- Left Span Add-on -->\n    <span class=\"input-group-addon\" data-ng-show=\"asType == 'span' && side == 'left'\">\n        <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n    </span>\n    <!-- Left Button Add-on -->\n    <span class=\"input-group-btn\" data-ng-show=\"asType == 'btn' && side == 'left'\">\n        <button class=\"btn btn-{{theme}}\" type=\"button\">\n            <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n        </button>\n    </span>\n\n    <!-- The input -->\n    <input type=\"{{type}}\" class=\"form-control\" placeholder=\"{{placeholder}}\">\n\n    <!-- Right Span Add-on -->\n    <span class=\"input-group-addon\" data-ng-show=\"asType == 'span' && side == 'right'\">\n        <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n    </span>\n    <!-- Right Button Add-on -->\n    <span class=\"input-group-btn\" data-ng-show=\"asType == 'btn' && side == 'right'\">\n        <button class=\"btn btn-{{theme}}\" type=\"button\">\n            <glyph icon=\"{{icon}}\" data-ng-show=\"icon\"></glyph> {{title}}\n        </button>\n    </span>\n</div>"
      };
    }
  ]);

}).call(this);

/*
//@ sourceMappingURL=input-group.map
*/

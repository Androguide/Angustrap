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
  ]).directive("alert", [
    function() {
      var defObj;
      defObj = {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          theme: "@",
          dismissible: "@"
        },
        template: '<div class="alert alert-{{theme}} {{dismissible ? alert-dismissible : \'\' }}" role="alert"> <button type="button" class="close" data-dismiss="alert" data-ng-show="dismissible"> <span aria-hidden="true">&times;</span> <span class="sr-only">Close</span> </button> <div data-ng-transclude></div> </div>',
        link: function(scope, el, attrs) {
          if (attrs.dismissible === "") {
            return attrs.dismissible = true;
          }
        }
      };
      return defObj;
    }
  ]).directive("dropdown", [
    function() {
      var defObj;
      defObj = {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          type: "@",
          theme: "@",
          icon: "@",
          size: "@",
          title: "@",
          dropup: "=",
          asClick: "="
        },
        template: '<div class="{{btnGroup}} {{directionClass}}"> <button type="button" class="btn btn-{{theme}} btn-{{size}}" data-toggle="{{dataToggle}}"> <glyph icon="{{icon}}"></glyph> {{title}} <span class="caret" data-ng-hide="isSplit"></span> </button> <button type="button" class="btn btn-{{theme}} btn-{{size}} dropdown-toggle" data-toggle="dropdown" data-ng-show="isSplit" style="height: {{caretHeight}}px"> <span class="caret"></span> <span class="sr-only" style="position: relative"></span> </button> <ul class="dropdown-menu" role="menu" data-ng-transclude></ul> </div>',
        controller: [
          '$scope', 'CleanUp', function($scope, CleanUp) {
            $scope.caretHeight = 34;
            if ($scope.dropup) {
              $scope.directionClass = "dropup";
            } else {
              $scope.directionClass = "dropdown";
            }
            if ($scope.size === "lg") {
              $scope.caretHeight = 46;
            } else if ($scope.size === "sm") {
              $scope.caretHeight = 30;
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
        template: '<li role="presentation" class="divider"></li>'
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
          asHref: "@"
        },
        template: '<li role="presentation"> <a role="menuitem" tabindex="-1" href="{{asHref}}" data-ng-transclude></a> </li>'
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
          icon: "@",
          theme: "@",
          size: "@"
        },
        link: function(scope, el, attrs) {
          return attrs.theme = attrs.theme || "default";
        },
        template: '<button type="button" class="btn btn-{{theme}} btn-{{size}}"> <span class="glyphicon glyphicon-{{icon}}"></span> <span data-ng-transclude></span> </button>'
      };
      return defObj;
    }
  ]).directive("glyph", [
    function() {
      var defObj;
      defObj = {
        restrict: "E",
        replace: true,
        template: '<span class=\"glyphicon glyphicon-{{icon}}\"></span>',
        scope: {
          icon: "@"
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
          title: "@",
          asType: "@",
          side: "@",
          icon: "@",
          size: "@",
          theme: "@",
          type: "@"
        },
        controller: [
          '$scope', 'CleanUp', function($scope, CleanUp) {
            return CleanUp($scope);
          }
        ],
        template: '<div class="input-group {{sizeWildcard}}{{size}}"> <!-- Left Span Add-on --> <span class="input-group-addon" data-ng-show="asType == \'span\' && side == \'left\'"> <glyph icon="{{icon}}" data-ng-show="icon"></glyph> {{title}} </span> <!-- Left Button Add-on --> <span class="input-group-btn" data-ng-show="asType == \'btn\' && side == \'left\'"> <button class="btn btn-{{theme}}" type="button"> <glyph icon="{{icon}}" data-ng-show="icon"></glyph> {{title}} </button> </span> <!-- The input --> <input type="{{type}}" class="form-control" placeholder="{{placeholder}}"> <!-- Right Span Add-on --> <span class="input-group-addon" data-ng-show="asType == \'span\' && side == \'right\'"> <glyph icon="{{icon}}" data-ng-show="icon"></glyph> {{title}} </span> <!-- Right Button Add-on --> <span class="input-group-btn" data-ng-show="asType == \'btn\' && side == \'right\'"> <button class="btn btn-{{theme}}" type="button"> <glyph icon="{{icon}}" data-ng-show="icon"></glyph> {{title}} </button> </span> </div>'
      };
    }
  ]).directive("asLabel", [
    function() {
      var defObj;
      defObj = {
        restrict: "E",
        replace: true,
        transclude: true,
        template: '<span class="label label-{{theme}}" data-ng-transclude></span>',
        scope: {
          theme: "@"
        },
        link: function(scope, el, attrs) {
          if (!attrs.theme) {
            return attrs.theme = "default";
          }
        }
      };
      return defObj;
    }
  ]).directive("navbarDropdown", [
    function() {
      return {
        restrict: "E",
        replace: true,
        transclude: true,
        scope: {
          title: "@"
        },
        template: '<li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{title}} <b class="caret"></b></a> <ul class="dropdown-menu" data-ng-transclude></ul> </li>'
      };
    }
  ]).directive("navbarList", [
    function() {
      return {
        restrict: "E",
        replace: true,
        transclude: true,
        template: '<ul class="nav navbar-nav {{wildcard}}{{side}}" data-ng-transclude></ul>',
        scope: {
          side: "@"
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
          theme: "@",
          title: "@",
          titleHref: "@",
          fixed: "@",
          center: "="
        },
        template: '<nav class="navbar navbar-{{theme}} {{fixedWildcard}}{{fixed}}" role="navigation"> <div class="{{container}}"> <div class="navbar-header"> <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="{{hashRandom}}"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button> <a class="navbar-brand" ng-href="{{titleHref}}">{{title}}</a> </div> <div class="collapse navbar-collapse" id="{{random}}"> <div class="{{center && \'container\' || \'\'}}" data-ng-transclude></div> </div> </div> </nav>',
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
  ]).directive("panel", [
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
        template: '<div class="panel panel-{{theme}}"> <div class="panel-heading" data-ng-hide="footer"> <h3 class="panel-title">{{title}}</h3> </div> <div class="panel-body" data-ng-transclude></div> <div class="panel-footer" data-ng-show="footer">{{title}}</div> </div>',
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
  ]).directive("progressBar", [
    function() {
      return {
        restrict: "E",
        transclude: false,
        replace: true,
        scope: {
          theme: "@",
          current: "@",
          title: "@",
          striped: "@",
          animated: "@"
        },
        template: '<div class="progress"> <div class="progress-bar progress-bar-{{theme}} {{striped ? \'progress-bar-striped\' : \'\'}} {{animated ? \'active\' : \'\'}}" role="progressbar" aria-valuenow="{{current}}" aria-valuemin="0" aria-valuemax="100" style="width: {{current}}%"> <span class="sr-only">{{title}}</span> {{title}} </div> </div',
        link: function(scope, el, attrs) {
          if (attrs.striped === "") {
            attrs.striped = true;
          }
          if (attrs.animated === "") {
            return attrs.animated = true;
          }
        }
      };
    }
  ]);

}).call(this);

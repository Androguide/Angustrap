# Navigation Bar
# ==============
# 
# Bootstrap's navigation bar in just 2 lines of markup.
# <br/>
# ####Example:
# ```html
# <navbar-list side="right">
#     <list-item as-href="#">Item 1</list-item>
#     <list-item as-href="#">Item 2</list-item>
#     <list-item as-href="#">Item 3</list-item>
#    <navbar-dropdown title="Sign-In">
#        <list-item as-href="#">Dropdown item 1</list-item>
#        <list-item as-href="#">Dropdown item 2</list-item>
#    </navbar-dropdown>
# </navbar-list>
# ```

# Navbar `<navbar>`
# -----------------
# #### Attributes:
# * `theme`: Can be either `default` or `inverse`. If none is specified, Angustrap will fallback to `default`.
# * `title`: The navigation bar title, usually your brand name.
# * `titleHref`: The URL the navbar `title` link should point to
# * `fixed`: Whether the navbar should be fixed to the `top` or `bottom` of the page.
#   If this attribute is not specified or set to `static`, the navbar will be at the top of the screen and scroll with the content (`.navbar-static-top`).
# * `center`: Whether the navbar content & title should be centered (i.e: inside a `div.container`)
angular.module("Angustrap").directive("navbar", ["AsRandom", (AsRandom) ->
    restrict: "E"
    replace: true
    transclude: true

    scope:
        asId: "@asId"
        asClass: "@asClass"
        theme: "@theme"
        title: "@title"
        titleHref: "@titleHref"
        fixed: "@fixed"
        center: "=center"

    template: """
    <nav id="{{asId}}" class="navbar navbar-{{theme}} {{fixedWildcard}}{{fixed}} {{asClass}}" role="navigation">
        <div class="{{container}}">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="{{hashRandom}}">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" ng-href="{{titleHref}}">{{title}}</a>
            </div>
            <div class="collapse navbar-collapse" id="{{random}}">
                <div class="{{center && 'container' || '' }}" data-ng-transclude></div>
            </div>
        </div>
    </nav>
    """

    controller: ($scope, $timeout, CleanUp) ->
        $scope.random = "#" + AsRandom 12
        $scope.hashRandom = "#" + $scope.random
        $scope.container = "container"
        if !$scope.center then $scope.container = "container-fluid"
        if !$scope.theme then  $scope.theme = "default"
        if $scope.fixed then $scope.fixedWildcard = "navbar-fixed-"
        if !$scope.fixed or scope.fixed is "static" then $scope.fixedWildcard = "navbar-static-top"

        # Remove possible trailing spaces in class attribute
        CleanUp $scope
])

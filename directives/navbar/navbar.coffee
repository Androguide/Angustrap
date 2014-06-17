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
angular.module("Angustrap").directive("navbar", ['AsRandom', (AsRandom) ->
    restrict: "E"
    replace: true
    transclude: true
    templateUrl: "templates/navbar.html"
    scope:
        theme: "=?"
        title: "@title"
        titleHref: "@titleHref"
        fixed: "@fixed"
        asId: "@asId"
        asClass: "@asClass"

    controller: ($scope, $timeout, CleanUp) ->
        $scope.random = '#' + AsRandom 12
        if !$scope.theme then  $scope.theme = "default"
        if $scope.fixed is "bottom"
            $scope.fixedWildcard = "navbar-fixed-"
        else if $scope.fixed is "top"
            $scope.fixedWildcard = "navbar-static-"
        else
            $scope.fixedWildcard = ""

        # Remove possible trailing spaces in class attribute
        CleanUp $scope
])

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

# ###Navbar List
# ##### Attributes:
# * side: whether this list should be aligned to the `left` or to the `right` inside its parent `<navbar>`
directive("navbarList", [ ->
        restrict: "E"
        replace: true
        transclude: true
        template: '<ul class="nav navbar-nav {{wildcard}}{{side}}" data-ng-transclude></ul>'
        scope:
            side: "@"

        controller: ['$scope', 'CleanUp', ($scope, CleanUp) ->
            if $scope.side then $scope.wildcard = "navbar-" else $scope.wildcard = ""
            CleanUp $scope
        ]
    ]
)
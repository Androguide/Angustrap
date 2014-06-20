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

# NavbarDropdown `<navbar-dropdown>`
# ----------------------------------
#
# #### Attributes:
# * `title`: The title of the dropdown list item. Has the same appearance as a `<list-item>`
directive("navbarDropdown", [ ->
        restrict: "E"
        replace: true
        transclude: true
        scope:
            asId: "@asId"
            asClass: "@asClass"
            title: "@title"

        controller: ['$scope', 'CleanUp', ($scope, CleanUp) ->
            CleanUp $scope
        ]

        template: """
        <li class="dropdown {{asClass}}" id="{{asId}}">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{title}} <b class="caret"></b></a>
            <ul class="dropdown-menu" data-ng-transclude></ul>
        </li>
        """
    ]
)
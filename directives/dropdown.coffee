# ### Regular Dropdown
# #### Attributes:
#   * dropup: (_Boolean_) If set to true, the dropdown will effectively drop _up_ and the caret direction will be inverted.
#   If set to false or not specified, the element will drop _down_
# <br/>
# **Example**:<br/>
# ```html
# <dropdown>
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </dropdown>
#
# <!-- Dropup -->
# <dropdown dropup="true">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </dropdown>
# ```
angular.module('Angustrap').directive "dropdown", ->
    defObj =
        restrict: "E"
        replace: true
        transclude: true
        templateUrl: "templates/dropdowns/dropdown.html"
        scope:
            dropup: "@dropup"
        link: (scope) ->
            if scope.dropup then scope.directionClass = "dropup" else scope.directionClass = "dropdown"

    return defObj
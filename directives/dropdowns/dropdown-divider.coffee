# Dropdowns
# ---------
# Fully markup-driven directives to abstract
# Bootstrap's [dropdown](http://getbootstrap.com/components/#dropdowns) components.<br/><br/>
# _Note that you can still pass the usual `.dropdown-menu-right` class to right-align the dropdown relatively to its parent_

# ### Dropdown Divider
# The `<dropdown-divider>` directive used through transclusion by the other dropdown directives
angular.module("Angustrap", []).directive("dropdownDivider", ->
    defObj =
        restrict: "E"
        replace: true
        scope: {}
        template: "<li role=\"presentation\" class=\"divider\"></li>"

    return defObj
)

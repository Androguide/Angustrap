# Dropdowns
# ---------
# Fully markup-driven directives to abstract
# Bootstrap's [dropdown](http://getbootstrap.com/components/#dropdowns) components.<br/><br/>
# _Note that you can still pass the usual `.dropdown-menu-right` class to right-align the dropdown relatively to its parent_
#<br/>
#
# ### Split-button dropdown
# ##### Attributes:
#   * theme
#   * icon
#   * size
#   * title
#
# <br/>**Example**:<br/>
# ```html
# <split-dropdown theme="danger" size="lg" icon="qrcode" title="Sign-In">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </btn-dropdown>
# ```
angular.module("Angustrap").directive "splitDropdown", ($timeout) ->
    defObj =
        restrict: "E"
        replace: true
        transclude: true
        templateUrl: "templates/dropdowns/split-dropdown.html"
        scope:
            theme: "@theme"
            icon: "@icon"
            size: "@size"
            title: "@title"

        link: (scope, el, attrs) ->
            # If no `theme="primary|success|info|warning|danger"` attribute was passed, we default back to the `.btn-default` class.
            attrs.theme = attrs.theme or "default"
            return

    return defObj

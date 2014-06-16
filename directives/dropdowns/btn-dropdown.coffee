# Dropdowns
# ---------
# Fully markup-driven directives to abstract
# Bootstrap's [dropdown](http://getbootstrap.com/components/#dropdowns) components.<br/><br/>
# _Note that you can still pass the usual `.dropdown-menu-right` class to right-align the dropdown relatively to its parent_
#<br/>
#
# ### Single-button dropdown **(DEPRECATED)**
# #### Attributes:
#   * theme: the variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
#     The stock ones are as follows _(but you can create your own in your stylesheet if you want using the `btn-` prefix)_:
#       * `primary`
#       * `success`
#       * `info`
#       * `warning`
#       * `danger`
#
#   * icon: the variable part of the Bootstrap 3.x glyphicons classes (i.e without the 'glyphicon-' prefix).
#     See [here](http://getbootstrap.com/components/#glyphicons-glyphs) for the full list.
#
#   * size: the variable part of the Bootstrap 3.x buttons size classes (i.e without the 'btn-' prefix).
#     Possible choice are:
#       * `lg`
#       * `sm`
#       * `xs`
#
#   * title: The string to display inside the action button of the split dropdown
#
#   * dropup: (_Boolean_) If set to true, the dropdown will effectively drop _up_ and the caret direction will be inverted.
#   If set to false or not specified, the element will drop _down_
# <br/>
#
# **Example**:<br/>
# ```html
# <btn-dropdown theme="danger" size="lg" title="Sign-In">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </btn-dropdown>
#
# <!-- Drop up -->
# <btn-dropdown theme="danger" size="lg" title="Sign-In" dropup="true">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </btn-dropdown>
# ```
#<br/>
# **N.B**: this directive is now deprecated, use `<dropdown type="btn">` instead
angular.module("Angustrap", []).directive "btnDropdown", ->
    defObj =
        restrict: "E"
        replace: true
        transclude: true
        templateUrl: "templates/dropdowns/btn-dropdown.html"
        scope:
            theme: "@theme"
            size: "@size"
            title: "@title"
            dropup: "@dropup"

        link: (scope, el, attrs) ->
            # If no `theme="primary|success|info|warning|danger"` attribute was passed, we default back to the `.btn-default` class.
            attrs.theme = attrs.theme or "default"
            if scope.dropup then scope.directionClass = "dropup"
            console.e "The <btn-dropdown> directive is now deprecated. Please use <dropdown type='btn'> instead"
            return

    return defObj
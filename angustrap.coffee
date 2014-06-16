(->
    r = (t) ->
        (r, i) ->
            e.log "%c" + r, i + ";color:#fff;background:" + n[1][t]
            return
    e = console
    t = 3
    n = [["e", "s", "i"], ["#c0392b", "#2ecc71", "#3498db"]]
    e[n[0][t]] = r(t) while t--
    return
)()

angular.module("Angustrap", [])

# Glyphicons
# ----------
# Shortcut directives for Bootstrap's glyphicons.<br/><br/>
# **Examples**:<br/>
# ```html
# <glyph icon="heart"></glyph>
# <glyph icon="qrcode">Sign-In</glyph>
# <btn-glyph icon="heart-empty">Angustrap</glyph>
# ```
# <br/>
# _For the list of all available icons, see http://getbootstrap.com/components/#glyphicons-glyphs_

# ### Simple glyph icon (span)
# **Attributes**:
#   - icon: the variable part of the Bootstrap 3.x glyphicons classes (i.e without the 'glyphicon-' prefix).
#           See [here](http://getbootstrap.com/components/#glyphicons-glyphs) for the full list.
.directive("glyph", ->
    defObj =
        restrict: "E"
        replace: true
        template: "<span class=\"glyphicon glyphicon-{{icon}}\"></span>"
        scope:
            icon: "@icon"

    return defObj
)

# ### Button glyphicon
# **Attributes**:
#   - `icon`: the variable part of the Bootstrap 3.x glyphicons classes (i.e without the 'glyphicon-' prefix).
#             See [here](http://getbootstrap.com/components/#glyphicons-glyphs) for the full list.
#
#   - `theme`: the variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
#              The stock ones are as follows, but you can create your own in your stylesheet if you want:
#                * `primary`
#                * `success`
#                * `info`
#                * `warning`
#                * `danger`
#
#             _**Note**: If no `theme` attribute is specified, Angustrap will default-back to Bootstrap's `.btn-default` class_
#
#   - `size`: the variable part of the Bootstrap 3.x buttons size classes (i.e without the 'btn-' prefix).
#             Possible choice are:
#               * `lg_
#               * `sm`
#               * `xs`
.directive("btnGlyph", ($timeout) ->
    defObj =
        restrict: "E"
        replace: true
        transclude: true
        templateUrl: "templates/dropdowns/btn-glyph.html"
        scope:
            icon: "@icon"
            theme: "@theme"
            size: "@size"
        link: (scope, el, attrs) ->
            console.log el
            attrs.theme = attrs.theme or "default"

    return  defObj
)

# Dropdowns
# ---------
# Fully markup-driven directives to abstract
# Bootstrap's [dropdown](http://getbootstrap.com/components/#dropdowns) components.<br/><br/>
# _Note that you can still pass the usual `.dropdown-menu-right` class to right-align the dropdown relatively to its parent_

# ### Dropdown Item
# This is the `<dropdown-item>` directive used through transclusion by the other dropdown directives.
# <br/>
# **Attributes**:
#   - `asHref`: the url this dropdown-item should point to
# _Note that you can still pass the usual `.disabled` class to disable an item
.directive("dropdownItem", ->
    defObj =
        restrict: "E"
        replace: true
        transclude: true
        templateUrl: "templates/dropdowns/dropdown-item.html"
        scope:
            asHref: "@asHref"

    return defObj
)

# ### Dropdown Divider
# The `<dropdown-divider>` directive used through transclusion by the other dropdown directives
.directive("dropdownDivider", ->
    defObj =
        restrict: "E"
        replace: true
        scope: {}
        template: "<li role=\"presentation\" class=\"divider\"></li>"

    return defObj
)

# ### Regular Dropdown
# #### Attributes:
#   * dropup: (_Boolean_) If set to true, the dropdown will effectively drop _up_ and the caret direction will be inverted.
#   If set to false or not specified, the element will drop _down_
# <br/>
#
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
.directive("dropdown", ->
    defObj =
        restrict: "E"
        replace: true
        transclude: true
        templateUrl: "templates/dropdowns/dropdown.html"
        scope:
            dropup: "=dropup"
        link: (scope) ->
            if scope.dropup then scope.directionClass = "dropup" else scope.directionClass = "dropdown"

    return defObj
)

# ### Single-button dropdown
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
.directive "btnDropdown", ->
    defObj =
        restrict: "E"
        replace: true
        transclude: true
        templateUrl: "templates/dropdowns/btn-dropdown.html"
        scope:
            theme: "@theme"
            size: "@size"
            title: "@title"
            dropup: "=dropup"

        link: (scope, el, attrs) ->
            # If no `theme="primary|success|info|warning|danger"` attribute was passed, we default back to the `.btn-default` class.
            attrs.theme = attrs.theme or "default"
            if scope.dropup then scope.directionClass = "dropup"
            return

    return defObj

# ### Split-button dropdown
# ##### Attributes:
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
# <split-dropdown theme="danger" size="lg" icon="qrcode" title="Sign-In">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </btn-dropdown>
# ```
.directive "splitDropdown", ->
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
            dropup: "=dropup"

        link: (scope, el, attrs) ->
            # If no `theme="primary|success|info|warning|danger"` attribute was passed, we default back to the `.btn-default` class.
            attrs.theme = attrs.theme or "default"
            if scope.dropup then scope.directionClass = "dropup"
            return

    return defObj


# RainbowLog
# ----------
# Provides colored console output: https://github.com/Androguide/RainbowLog
(->
    r = (t) ->
        (r, i) ->
            e.log "%c" + r, i + ";color:#fff;background:" + n[1][t]
    e = console
    t = 3
    n = [
        ["e", "s", "i"],
        ["#c0392b", "#2ecc71", "#3498db"]
    ]
    e[n[0][t]] = r(t) while t--
    return)()
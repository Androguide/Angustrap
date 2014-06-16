# ### Mutable Dropdown
# #### Attributes:
#  * theme: the variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
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
#   * title: the string to display inside the action button of the split dropdown
#
#   * dropup: (_Boolean_) If set to true, the dropdown will effectively drop _up_ and the caret direction will be inverted.
#   If set to false or not specified, the element will drop _down_
#
#   * type: the type of your dropdown, either `btn` for a button dropdown or `split` for a split dropdown<br/>
#
# **Example**:<br/>
# ```html
# <!-- Button Dropdown -->
# <dropdown type="btn" title="Button Dropdown" theme="warning" id="test" size="sm" icon="qrcode">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </dropdown>
#
# <!-- Split Dropdown -->
# <dropdown type="split" title="Split Dropdown" theme="warning" id="test" size="sm" icon="qrcode">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </dropdown>
#
# <!-- Dropup -->
# <dropdown type="btn" title="Button Dropup" theme="warning" id="test" size="sm" icon="qrcode" dropup="true">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </dropdown>
# ```
angular.module('Angustrap', []).directive "dropdown", ->
    defObj =
        restrict: "E"
        replace: true
        transclude: true
        templateUrl: "templates/dropdowns/dropdown.html"
        scope:
            type: "@type"
            theme: "@theme"
            icon: "@icon"
            size: "@size"
            title: "@title"
            dropup: "=dropup"
            asClick: "=asClick"

        link:
            pre: (scope) ->
                if scope.dropup then scope.directionClass = "dropup" else scope.directionClass = "dropdown"
                console.log "type: ", scope.type
                if scope.type == "split"
                    scope.isSplit = true
                    scope.btnGroup = "btn-group"

                else if scope.type == "btn"
                    scope.isSplit = false
                    scope.srOnly = ""
                    scope.btnGroup = ""

                else if !scope.type
                    scope.srOnly = "sr-only"
                    scope.isSplit = false
                    scope.btnGroup = ""

    return defObj

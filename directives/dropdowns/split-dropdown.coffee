# Dropdowns
# ---------
# Fully markup-driven directives to abstract
# Bootstrap's [dropdown](http://getbootstrap.com/components/#dropdowns) components.<br/><br/>
# _Note that you can still pass the usual `.dropdown-menu-right` class to right-align the dropdown relatively to its parent_
#<br/>

# ### Split-button dropdown **(DEPRECATED)**
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
# </split-dropdown>
#
# <!-- Drop up -->
# <split-dropdown theme="danger" size="lg" icon="qrcode" title="Sign-In" dropup="true">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </split-dropdown>
# ```
# <br/>
# **N.B**: this directive is now deprecated, use `<dropdown type="split">` instead
.directive("splitDropdown", ->
    defObj =
        restrict: "E"
        replace: true
        transclude: true
        template: """
        <div class="btn-group {{directionClass}}">
            <button type="button" class="btn btn-{{theme}}">
                <glyph icon="{{icon}}"></glyph> {{title}}
            </button>
            <button type="button" class="btn btn-{{theme}} dropdown-toggle" data-toggle="dropdown">
                <span class="caret"></span>
                <span class="sr-only" style="position: relative"></span>
            </button>
            <ul class="dropdown-menu" role="menu" data-ng-transclude></ul>
        </div>
        """
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
            console.e "The <split-dropdown> directive is now deprecated. Please use <dropdown type='split'> instead"
            return

    return defObj
)


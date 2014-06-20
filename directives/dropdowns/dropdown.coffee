# ### Mutable Dropdown
# #### Attributes:
#  * `theme`: the variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
#     The stock ones are as follows _(but you can create your own in your stylesheet if you want using the `btn-` prefix)_:
#       * `primary`
#       * `success`
#       * `info`
#       * `warning`
#       * `danger`
#
#   * `icon`: the variable part of the Bootstrap 3.x glyphicons classes (i.e without the 'glyphicon-' prefix).
#     See [here](http://getbootstrap.com/components/#glyphicons-glyphs) for the full list.
#
#   * `size`: the variable part of the Bootstrap 3.x buttons size classes (i.e without the 'btn-' prefix).
#     Possible choice are:
#       * `lg`
#       * `sm`
#       * `xs`
#
#   * `title`: the string to display inside the action button of the split dropdown
#
#   * `dropup`: (_Boolean_) If set to true, the dropdown will effectively drop _up_ and the caret direction will be inverted.
#   If set to false or not specified, the element will drop _down_
#
#   * `as-type`: the type of your dropdown, either `btn` for a button dropdown or `split` for a split dropdown<br/>
#
#   * `as-click`: **only relevant for split dropdowns**<br/> a piece of JavaScript to execute when the left button is clicked
#
# **Example**:<br/>
# ```html
# <!-- Button Dropdown -->
# <dropdown as-type="btn" title="Button Dropdown" theme="warning" id="test" size="sm" icon="qrcode">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </dropdown>
#
# <!-- Split Dropdown -->
# <dropdown as-type="split" title="Split Dropdown" theme="warning" id="test" size="sm" icon="qrcode">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </dropdown>
#
# <!-- Dropup -->
# <dropdown as-type="btn" title="Button Dropup" theme="warning" id="test" size="sm" icon="qrcode" dropup="true">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </dropdown>
# ```
directive("dropdown", [ ->
        defObj =
            restrict: "E"
            replace: true
            transclude: true
            scope:
                asType: "@asType"
                theme: "@theme"
                icon: "@icon"
                size: "@size"
                title: "@title"
                dropup: "=dropup"
                asClick: "=asClick"

            template: """
            <div class="{{btnGroup}} {{directionClass}}">
                <button type="button" class="btn btn-{{theme}} btn-{{size}}" data-toggle="{{dataToggle}}" data-ng-click="{{asClick}}">
                    <glyph icon="{{icon}}" ng-show="isSplit" style="font-size: 0.95em"></glyph>
                    <glyph icon="{{icon}}" ng-hide="isSplit"></glyph>
                     {{title}}
                    <span class="caret" data-ng-hide="isSplit"></span>
                </button>
                <button type="button" class="btn btn-{{theme}} btn-{{size}} dropdown-toggle" data-toggle="dropdown" data-ng-show="isSplit">
                    <span class="caret"></span>
                    <span class="sr-only" style="position: relative"></span>
                </button>
                <ul class="dropdown-menu" role="menu" data-ng-transclude></ul>
            </div>
            """

            controller: ['$scope', 'CleanUp', ($scope, CleanUp) ->
                $scope.size = "" unless $scope.size
                if $scope.dropup then $scope.directionClass = "dropup" else $scope.directionClass = ""
                if $scope.asType == "split"
                    $scope.isSplit = true
                    $scope.dataToggle = ""
                    $scope.btnGroup = "btn-group"

                else if $scope.asType == "btn" or !$scope.asType
                    $scope.isSplit = false
                    $scope.dataToggle = "dropdown"
                    $scope.btnGroup = ""

                CleanUp $scope
            ]

        return defObj
    ]
)
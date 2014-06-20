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
directive("btnGlyph", [($timeout) ->
        defObj =
            restrict: "E"
            replace: true
            transclude: true
            scope:
                icon: "@icon"
                theme: "@theme"
                size: "@size"

            link: (scope, el, attrs) ->
                attrs.theme = attrs.theme or "default"

            template: """
        <button type="button" class="btn btn-{{theme}} btn-{{size}}">
            <span class="glyphicon glyphicon-{{icon}}"></span>
            <span data-ng-transclude></span>
        </button>
        """

        return  defObj
    ]
)
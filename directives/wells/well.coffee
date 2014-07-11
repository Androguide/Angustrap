# Wells
# ----------
# Shortcut directives for Bootstrap's wells.<br/><br/>
# **Examples**:<br/>
# ```html
# <well size="lg">Help! I fell in the big well!</as-label>
# ```
# <br/>

# **Attributes**:
#   * size: the variable part of the Bootstrap 3.x buttons size classes (i.e without the 'btn-' prefix).
#     Possible choice are:
#       * `lg`
#       * `sm`
#       * `xs`
#
#   _**Note:** if no size attribute is specified, Angustrap will fallback to Bootstrap's default well size_

directive("well", [ ->
        defObj =
            restrict: "E"
            replace: true
            transclude: true
            template: '<div class="well well-{{size}}" data-ng-transclude></div>'
            scope:
                size: "@"

            link: (scope, el, attrs) ->
                if !attrs.size then attrs.size = "md"

        return defObj
    ]
)
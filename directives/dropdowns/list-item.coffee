# ### List Item
# This is the `<dropdown-item>` directive used through transclusion by the other dropdown directives.
# <br/>
# **Attributes**:
#   - `as-href`: the url this dropdown-item should point to
#   - `as-click`: a piece of JavaScript code to execute when the link is clicked
#
# _Note that you can still pass Bootstrap's usual `.disabled` class to disable an item
directive("listItem", [ ->
    defObj =
        restrict: "E"
        replace: true
        transclude: true
        scope:
            asHref: "@asHref"
            asClick: "=asClick"

        template: """
        <li role="presentation">
          <a role="menuitem" tabindex="-1" href="{{asHref}}" data-ng-click="{{asClick}}" data-ng-transclude></a>
        </li>
        """

    return defObj
])

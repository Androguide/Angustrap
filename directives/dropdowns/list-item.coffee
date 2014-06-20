# ### List Item
# This is the `<dropdown-item>` directive used through transclusion by the other dropdown directives.
# <br/>
# **Attributes**:
#   - `as-href`: the url this dropdown-item should point to
#
# _Note that you can still pass Bootstrap's usual `.disabled` class to disable an item
directive("listItem", [ ->
    defObj =
        restrict: "E"
        replace: true
        transclude: true
        scope:
            asHref: "@asHref"

        template: """
        <li role="presentation">
          <a role="menuitem" tabindex="-1" href="{{asHref}}" data-ng-transclude></a>
        </li>
        """

    return defObj
])

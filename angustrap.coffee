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
# Shortcut directive for Bootstrap's glyphicons.<br/><br/>
# **Example**:<br/>
# ```html
# <glyph icon="heart"></glyph>
# ```
# <br/>
# _For the list of all available icons, see http://getbootstrap.com/components/#glyphicons-glyphs_
.directive("glyph", ->
    defObj =
        restrict: "E"
        replace: true
        scope:
            icon: "@icon"
        template: "<span class=\"glyphicon glyphicon-{{icon}}\"></span>"

    return defObj
)

# Dropdowns
# ---------
# Fully markup-driven directives to abstract
# Bootstrap's [dropdown](http://getbootstrap.com/components/#dropdowns) components.<br/><br/>
# _Note that you can still pass the usual `.dropdown-menu-right` class to right-align the dropdown relatively to its parent_

# ### Dropdown Item
# This is the `<dropdown-item>` directive used through transclusion by the other dropdown directives.
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
# **Example**:<br/>
# ```html
# <dropdown as-id="myDropdown">
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
            asId: "@asId"

    return defObj
)

# ### Single-button dropdown
# **Example**:<br/>
# ```html
# <btn-dropdown as-id="myDropdown" theme="danger" size="lg">
#     <dropdown-item as-href="http://google.com">Google</dropdown-item>
#     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
# </btn-dropdown>
# ```
.directive "btnDropdown", ($timeout) ->
    defObj =
        restrict: "E"
        replace: true
        transclude: true
        templateUrl: "templates/dropdowns/button-dropdown.html"
        scope:
            asId: "@asId"
            theme: "@theme"
            size: "@size"
            title: "@title"

        link: (scope, el, attrs) ->
            # Specifying an `as-id="someId"` attribute is mandatory, return an error if none was found or if it's empty.
            if typeof attrs.asId is "undefined" or attrs.asId is ""
                console.e 'Angustrap: ERROR - You must define an ID for this dropdown, using the `as-id="yourId"` attribute'
                el.remove()
                return

            # If no `theme="primary|success|info|warning|danger"` attribute was passed, we default back to the `.btn-default` class.
            if typeof attrs.theme is "undefined" or attrs.theme is "" then attrs.theme = "default"

            # Clean-up empty class prefix if no size attribute is specified
            handleSize = ->
                angular.element("#" + attrs.asId).removeClass "btn-"  if typeof attrs.size is "undefined" or attrs.size is ""
                return

            # This $timeout is a workaround so that our function is not executed before the DOM is loaded
            $timeout handleSize, 0
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
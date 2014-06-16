window.replace = false
angular.module("Angustrap", [])

.service('AsRandom',  ->
    return (x) ->
        s = ""
        while s.length < x and x > 0
            r = Math.random()
            s += ((if r < 0.1 then Math.floor(r * 100) else String.fromCharCode(Math.floor(r * 26) + ((if r > 0.5 then 97 else 65)))))
        s
)

.service('CleanUp', ($timeout) ->
    return (scope) ->
        $timeout ->
            if scope.asId
                classes = $('#' + scope.asId).attr 'class'
                $('#' + scope.asId).attr 'class', classes.trim()
        , 0
)


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
        template: "<span id=\"{{asId}}\" class=\"glyphicon glyphicon-{{icon}} {{asClass}}\"></span>"
        scope:
            icon: "@icon"
            asId: "@asId"
            asClass: "@asClass"

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
.directive("listItem", ->
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
.directive("listDivider", ->
    defObj =
        restrict: "E"
        replace: true
        scope: {}
        template: "<li role=\"presentation\" class=\"divider\"></li>"

    return defObj
)

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
.directive("dropdown", ->
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
)


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
.directive("btnDropdown", ->
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
            console.e "The <btn-dropdown> directive is now deprecated. Please use <dropdown type='btn'> instead"
            return

    return defObj
)


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
            console.e "The <split-dropdown> directive is now deprecated. Please use <dropdown type='split'> instead"
            return

    return defObj
)


# Navigation Bar
# ==============
# 
# Bootstrap's navigation bar in just 2 lines of markup.
# <br/>
# ####Example:
# ```html
# <navbar-list side="right">
#     <list-item as-href="#">Item 1</list-item>
#     <list-item as-href="#">Item 2</list-item>
#     <list-item as-href="#">Item 3</list-item>
#    <navbar-dropdown title="Sign-In">
#        <list-item as-href="#">Dropdown item 1</list-item>
#        <list-item as-href="#">Dropdown item 2</list-item>
#    </navbar-dropdown>
# </navbar-list>
# ```

# Navbar `<navbar>`
# -----------------
# #### Attributes:
# * `theme`: Can be either `default` or `inverse`. If none is specified, Angustrap will fallback to `default`.
# * `title`: The navigation bar title, usually your brand name.
# * `titleHref`: The URL the navbar `title` link should point to
.directive("navbar", ['AsRandom', (AsRandom) ->
        restrict: "E"
        replace: true
        transclude: true
        templateUrl: "templates/navbar.html"
        scope:
            theme: "=?"
            title: "@title"
            titleHref: "@titleHref"
            fixed: "@fixed"
            asId: "@asId"
            asClass: "@asClass"

        controller: ($scope, $timeout, CleanUp) ->
            $scope.random = '#' + AsRandom 12
            if !$scope.theme then  $scope.theme = "default"
            if $scope.fixed is "bottom"
                $scope.fixedWildcard = "navbar-fixed-"
            else if $scope.fixed is "top"
                $scope.fixedWildcard = "navbar-static-"
            else
                $scope.fixedWildcard = ""

            # Remove possible trailing spaces in class attribute
            CleanUp $scope
    ])

# ###Navbar List
# ##### Attributes:
# * side: whether this list should be aligned to the `left` or to the `right` inside its parent `<navbar>`
.directive("navbarList", ->
    restrict: "E"
    replace: true
    transclude: true
    template: "<ul class=\"nav navbar-nav {{wildcard}}{{side}}\" data-ng-transclude></ul>"
    scope:
        asId: "@asId"
        asClass: "@asClass"
        side: "@side"

    controller: ($scope, CleanUp) ->
        if $scope.side then $scope.wildcard = "navbar-" else $scope.wildcard = ""
        CleanUp $scope
)

# NavbarDropdown `<navbar-dropdown>`
# -----------------
#
# #### Attributes:
# * `title`: The title of the dropdown list item. Has the same appearance as a `<list-item>`
.directive("navbarDropdown", ->
    restrict: "E"
    replace: true
    transclude: true
    scope:
        asId: "@asId"
        asClass: "@asClass"
        title: "@title"

    controller: ($scope, CleanUp) ->
        CleanUp $scope

    template: """
        <li class="dropdown {{asClass}}" id="{{asId}}">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{title}} <b class="caret"></b></a>
            <ul class="dropdown-menu" data-ng-transclude></ul>
        </li>
        """
)

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
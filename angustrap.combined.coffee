angular.module("Angustrap", []).

service('AsRandom', [ ->
        return (x) ->
            s = ""
            while s.length < x and x > 0
                r = Math.random()
                s += ((if r < 0.1 then ~~(r * 100) else String.fromCharCode(~~(r * 26) + ((if r > 0.5 then 97 else 65)))))
            return s
    ]
).

service('CleanUp', ['$timeout', ($timeout) ->
        return (scope) ->
            $timeout ->
                if scope.asId
                    classes = $('#' + scope.asId).attr 'class'
                    $('#' + scope.asId).attr 'class', classes.trim()
            , 0
    ]
)
.

# ### Alerts
# #### Attributes:
#  * `theme`: the variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
#     The stock ones are as follows _(but you can create your own in your stylesheet if you want using the `btn-` prefix)_:
#       * `primary`
#       * `success`
#       * `info`
#       * `warning`
#       * `danger`
#
#  * `dismissible`: Whether the alert should be dismissible via a close button at its top-right corner
#
# #### Examples:
# ```
# <!-- Simple alert -->
# <alert theme="danger">Something ain't right!</alert>
#
# <!-- Dismissible alert -->
# <alert theme="success" dismissible>Props! You did it!</alert>
# ```

directive("alert", [ ->
        defObj =
            restrict: "E"
            replace: true
            transclude: true
            scope:
                theme: "@"
                dismissible: "@"

            template: '<div class="alert alert-{{theme}} {{dismissible ? alert-dismissible : \'\' }}" role="alert">
                           <button type="button" class="close" data-dismiss="alert" data-ng-show="dismissible">
                               <span aria-hidden="true">&times;</span>
                               <span class="sr-only">Close</span>
                           </button>
                           <div data-ng-transclude></div>
                       </div>'

            link: (scope, el, attrs) ->
                if attrs.dismissible is "" then attrs.dismissible = true

        return defObj
    ]
).

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
#   * size: the variable part of the Bootstrap 3.x well size classes (i.e without the 'btn-' prefix).
#     Possible choice are:
#       * `lg`
#       * `sm`
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
directive("dropdown", [ ->
        defObj =
            restrict: "E"
            replace: true
            transclude: true
            scope:
                type: "@"
                theme: "@"
                icon: "@"
                size: "@"
                title: "@"
                dropup: "="
                asClick: "="

            template: '
            <div class="{{btnGroup}} {{directionClass}}">
                <button type="button" class="btn btn-{{theme}} btn-{{size}}" data-toggle="{{dataToggle}}">
                    <glyph icon="{{icon}}"></glyph> {{title}}
                    <span class="caret" data-ng-hide="isSplit"></span>
                </button>
                <button type="button" class="btn btn-{{theme}} btn-{{size}} dropdown-toggle" data-toggle="dropdown" data-ng-show="isSplit" style="height: {{caretHeight}}px">
                    <span class="caret"></span>
                    <span class="sr-only" style="position: relative"></span>
                </button>
                <ul class="dropdown-menu" role="menu" data-ng-transclude></ul>
            </div>'

            controller: ['$scope', 'CleanUp', ($scope, CleanUp) ->
                $scope.caretHeight = 34
                if $scope.dropup then $scope.directionClass = "dropup" else $scope.directionClass = "dropdown"
                if $scope.size is "lg"
                    $scope.caretHeight = 46
                else if $scope.size is "sm"
                    $scope.caretHeight = 30

                if $scope.type == "split"
                    $scope.isSplit = true
                    $scope.dataToggle = ""
                    $scope.btnGroup = "btn-group"

                else if $scope.type == "btn" or !$scope.type
                    $scope.isSplit = false
                    $scope.dataToggle = "dropdown"
                    $scope.btnGroup = ""

                CleanUp $scope
            ]

        return defObj
    ]
).

# Dropdowns
# ---------
# Fully markup-driven directives to abstract
# Bootstrap's [dropdown](http://getbootstrap.com/components/#dropdowns) components.<br/><br/>
# _Note that you can still pass the usual `.dropdown-menu-right` class to right-align the dropdown relatively to its parent_

# ### Dropdown Divider
# The `<dropdown-divider>` directive used through transclusion by the other dropdown directives
directive("listDivider", [ ->
        defObj =
            restrict: "E"
            replace: true
            scope: {}
            template: '<li role="presentation" class="divider"></li>'

        return defObj
    ]
).

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
            asHref: "@"

        template: '
        <li role="presentation">
          <a role="menuitem" tabindex="-1" href="{{asHref}}" data-ng-transclude></a>
        </li>'

    return defObj
])
.

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
                icon: "@"
                theme: "@"
                size: "@"

            link: (scope, el, attrs) ->
                attrs.theme = attrs.theme or "default"

            template: '
            <button type="button" class="btn btn-{{theme}} btn-{{size}}">
                <span class="glyphicon glyphicon-{{icon}}"></span>
                <span data-ng-transclude></span>
            </button>'

        return  defObj
    ]
).

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
directive("glyph", [ ->
        defObj =
            restrict: "E"
            replace: true
            template: '<span class=\"glyphicon glyphicon-{{icon}}\"></span>'
            scope:
                icon: "@"

        return defObj
    ]
).

# InputGroup `<input-group>`
# ----------------------------------
# A single directive to abstract all of Bootstrap's input-group components.
#
# # ####Examples:
# ```html
# <!-- Left-aligned large <span> add-on with text input -->
# <input-group title="@" as-type="span" size="lg" side="left" type="text"></input-group>
#
# <!-- Right-aligned blue <button> add-on with email input -->
# <input-group title="@" as-type="btn" side="right" type="email" theme="primary"></input-group>
# ```
#
# #### Attributes:
# * `title`: The text to display inside of the input add-on (span, button... depending on the `type` attribute)
#
# * `as-type`: The type of the add-on. Can be on of the following:
#   * `span`: Will result in a `<span>` add-on
#   * `btn`: Will result in a `<button>` add-on
#
# * `type`: The HTML5 `type` attribute of the `<input>` ("text", "tel", "number", "email", etc...)
#
# * `side`: Whether the add-on should be on the `left` or on the `right` of the `<input>`
#
# * `size`: Defines the size of the input-group. Accepted values are:
#   * `lg`
#   * `sm`
#  If none is specified, the default size is used.
#
# * `theme`: _Only valid for button input-groups (`<input-group as-type="btn">`)._
#     The variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
#     The stock ones are as follows _(but you can create your own in your stylesheet if you want using the `btn-` prefix)_:
#     * `primary`
#     * `success`
#     * `info`
#     * `warning`
#     * `danger`
directive("inputGroup", [ ->
        restrict: "E"
        replace: true
        transclude: true
        scope:
            title: "@"
            asType: "@"
            side: "@"
            icon: "@"
            size: "@"
            theme: "@"
            type: "@"

        controller: ['$scope', 'CleanUp', ($scope, CleanUp) ->
            CleanUp $scope
        ]


        template: '
        <div class="input-group {{sizeWildcard}}{{size}}">
            <!-- Left Span Add-on -->
            <span class="input-group-addon" data-ng-show="asType == \'span\' && side == \'left\'">
                <glyph icon="{{icon}}" data-ng-show="icon"></glyph> {{title}}
            </span>
            <!-- Left Button Add-on -->
            <span class="input-group-btn" data-ng-show="asType == \'btn\' && side == \'left\'">
                <button class="btn btn-{{theme}}" type="button">
                    <glyph icon="{{icon}}" data-ng-show="icon"></glyph> {{title}}
                </button>
            </span>

            <!-- The input -->
            <input type="{{type}}" class="form-control" placeholder="{{placeholder}}">

            <!-- Right Span Add-on -->
            <span class="input-group-addon" data-ng-show="asType == \'span\' && side == \'right\'">
                <glyph icon="{{icon}}" data-ng-show="icon"></glyph> {{title}}
            </span>
            <!-- Right Button Add-on -->
            <span class="input-group-btn" data-ng-show="asType == \'btn\' && side == \'right\'">
                <button class="btn btn-{{theme}}" type="button">
                    <glyph icon="{{icon}}" data-ng-show="icon"></glyph> {{title}}
                </button>
            </span>
        </div>'
    ]
).

# Labels
# ----------
# Shortcut directives for Bootstrap's labels.<br/><br/>
# **Examples**:<br/>
# ```html
# <as-label theme="success">Yeehaaa!</as-label>
# <as-label theme="danger">Booo!</as-label>
# ```
# <br/>

# **Attributes**:
#    * `theme`: The variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).<br/>
#     The stock ones are as follows _(but you can create your own in your stylesheet if you want using the `btn-` prefix)_:
#     * `primary`
#     * `success`
#     * `info`
#     * `warning`
#     * `danger`

directive("asLabel", [ ->
        defObj =
            restrict: "E"
            replace: true
            transclude: true
            template: '<span class="label label-{{theme}}" data-ng-transclude></span>'
            scope:
                theme: "@"

            link: (scope, el, attrs) ->
                if !attrs.theme then attrs.theme = "default"

        return defObj
    ]
).

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

# NavbarDropdown `<navbar-dropdown>`
# ----------------------------------
#
# #### Attributes:
# * `title`: The title of the dropdown list item. Has the same appearance as a `<list-item>`
directive("navbarDropdown", [ ->
        restrict: "E"
        replace: true
        transclude: true
        scope:
            title: "@"

        template: '
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{title}} <b class="caret"></b></a>
            <ul class="dropdown-menu" data-ng-transclude></ul>
        </li>'
    ]
).

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

# ###Navbar List
# ##### Attributes:
# * side: whether this list should be aligned to the `left` or to the `right` inside its parent `<navbar>`
directive("navbarList", [ ->
        restrict: "E"
        replace: true
        transclude: true
        template: '<ul class="nav navbar-nav {{wildcard}}{{side}}" data-ng-transclude></ul>'
        scope:
            side: "@"

        controller: ['$scope', 'CleanUp', ($scope, CleanUp) ->
            if $scope.side then $scope.wildcard = "navbar-" else $scope.wildcard = ""
            CleanUp $scope
        ]
    ]
).

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
# * `fixed`: Whether the navbar should be fixed to the `top` or `bottom` of the page.
#   If this attribute is not specified or set to `static`, the navbar will be at the top of the screen and scroll with the content (`.navbar-static-top`).
# * `center`: Whether the navbar content & title should be centered (i.e: inside a `div.container`)
directive("navbar", ["AsRandom", (AsRandom) ->
        restrict: "E"
        replace: true
        transclude: true

        scope:
            theme: "@"
            title: "@"
            titleHref: "@"
            fixed: "@"
            center: "="

        template: '
        <nav class="navbar navbar-{{theme}} {{fixedWildcard}}{{fixed}}" role="navigation">
            <div class="{{container}}">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="{{hashRandom}}">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" ng-href="{{titleHref}}">{{title}}</a>
                </div>
                <div class="collapse navbar-collapse" id="{{random}}">
                    <div class="{{center && \'container\' || \'\'}}" data-ng-transclude></div>
                </div>
            </div>
        </nav>'

        controller: ['$scope', '$timeout', 'CleanUp', ($scope, $timeout, CleanUp) ->
            $scope.random = "#" + AsRandom 12
            $scope.hashRandom = "#" + $scope.random
            $scope.container = "container"
            if !$scope.center then $scope.container = "container-fluid"
            if !$scope.theme then  $scope.theme = "default"
            if $scope.fixed then $scope.fixedWildcard = "navbar-fixed-"
            if !$scope.fixed or scope.fixed is "static" then $scope.fixedWildcard = "navbar-static-top"

            # Remove possible trailing spaces in class attribute
            CleanUp $scope
        ]
    ]
).

# ### Panels
# #### Attributes:
#  * theme: the variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
#     The stock ones are as follows _(but you can create your own in your stylesheet if you want using the `btn-` prefix)_:
#       * `primary`
#       * `success`
#       * `info`
#       * `warning`
#       * `danger`
#
#  * title: the string to display inside the action button of the split dropdown
#
#  * footer: whether the panel's heading should be at the bottom or top
#
# #### Examples:
# ```
# <!-- Default panel -->
# <panel title="My Panel">
#    ...
# </panel>
#
# <!-- Themed panel -->
# <panel title="My Panel" theme="primary">
#    ...
# </panel>
#
# <!-- Panel with footer -->
# <panel title="My Panel" theme="primary" footer>
# ...
# </panel>
# ```

directive("panel", [ ->
        defObj =
            restrict: "E"
            replace: true
            transclude: true
            scope:
                theme: "@"
                title: "@"
                footer: "@"

            template: '
            <div class="panel panel-{{theme}}">
              <div class="panel-heading" data-ng-hide="footer">
                <h3 class="panel-title">{{title}}</h3>
              </div>
              <div class="panel-body" data-ng-transclude></div>
              <div class="panel-footer" data-ng-show="footer">{{title}}</div>
            </div>'

            controller: ['$scope', ($scope) ->
               unless $scope.theme then $scope.theme = "default"
            ]

            link: (scope, el, attrs) ->
                if attrs.footer is "" then attrs.footer = true

        return defObj
    ]
).

# ### Progress Bars
# #### Attributes:
#  * `theme`: _(String)_ the variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
#     The stock ones are as follows _(but you can create your own in your stylesheet if you want using the `btn-` prefix)_:
#       * `primary`
#       * `success`
#       * `info`
#       * `warning`
#       * `danger`
#
#  * `current`: _(Integer)_ the current progress percentage
#
#  * `title`: _(String)_ the label to display inside the progressbar (optional)
#
#  * `striped`: _(Boolean)_ whether the progress-bar should be striped or not
#
#  * `animated`: _(Boolean)_ if the progress bar is `striped`, defined whether the progress-bar stripes should be animated
#
# #### Examples:
# ```
# <!-- Green Progress Bar -->
# <progress-bar theme="success" current="95"></progress-bar>
#
# <!-- Red Progress Bar with label -->
#  <progress-bar theme="danger" title="Angustrap" current="75"></progress-bar>
#
# <!-- Orange Striped Progress Bar with label -->
#  <progress-bar theme="warning" current="75" striped></progress-bar>
#
# <!-- Blue Animated Progress Bar with label -->
#  <progress-bar theme="warning" title="Angustrap" current="75" striped animated></progress-bar>
# ```

directive("progressBar", [  ->
    restrict: "E"
    transclude: false
    replace: true
    scope:
        theme: "@"
        current: "@"
        title: "@"
        striped: "@"
        animated: "@"

    template: '
    <div class="progress">
      <div class="progress-bar progress-bar-{{theme}} {{striped ? \'progress-bar-striped\' : \'\'}} {{animated ? \'active\' : \'\'}}" role="progressbar" aria-valuenow="{{current}}" aria-valuemin="0" aria-valuemax="100" style="width: {{current}}%">
        <span class="sr-only">{{title}}</span>
        {{title}}
      </div>
    </div'

    link: (scope, el, attrs) ->
        if attrs.striped is "" then attrs.striped = true
        if attrs.animated is "" then attrs.animated = true
]).

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
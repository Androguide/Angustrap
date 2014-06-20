# InputGroup `<input-group>`
# ----------------------------------
# A single directive to abstract all of Bootstrap's input-group components.
#
# # ####Examples:
# ```html
# <!-- Left-aligned large <span> add-on with text input -->
# <input-group title="@" type="span" size="lg" side="left" input-type="text"></input-group>
#
# <!-- Right-aligned blue <button> add-on with email input -->
# <input-group title="@" type="btn" side="right" input-type="email" theme="primary"></input-group>
# ```
#
# #### Attributes:
# * `title`: The text to display inside of the input add-on (span, button... depending on the `type` attribute)
#
# * `type`: The type of the add-on. Can be on of the following:
#   * `span`: Will result in a `<span>` add-on
#   * `btn`: Will result in a `<button>` add-on
#
# * `input-type`: The HTML5 `type` attribute of the `<input>` ("text", "tel", "number", "email", etc...)
#
# * `side`: Whether the add-on should be on the `left` or on the `right` of the `<input>`
#
# * `size`: Defines the size of the input-group. Accepted values are:
#   * `lg`
#   * `sm`
#  If none is specified, the default size is used.
#
# * `theme`: _Only valid for button input-groups (`<input-group type="btn">`)._
#     The variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
#     The stock ones are as follows _(but you can create your own in your stylesheet if you want using the `btn-` prefix)_:
#     * `primary`
#     * `success`
#     * `info`
#     * `warning`
#     * `danger`
#
# * `as-click`: A piece of JavaScript to execute when the input add-on is clicked
directive("inputGroup", [ ->
        restrict: "E"
        replace: true
        transclude: true
        scope:
            asId: "@asId"
            asClass: "@asClass"
            title: "@title"
            type: "@type"
            side: "@side"
            icon: "@icon"
            size: "@size"
            theme: "@theme"
            inputType: "@inputType"
            asClick: "=asClick"

        controller: ['$scope', 'CleanUp', ($scope, CleanUp) ->
            CleanUp $scope
        ]


        template: """
        <div id="{{asId}}" class="input-group {{sizeWildcard}}{{size}} {{asClass}}">
            <!-- Left Span Add-on -->
            <span class="input-group-addon" data-ng-show="type == 'span' && side == 'left'" data-ng-click="{{asClick}}">
                <glyph icon="{{icon}}" data-ng-show="icon"></glyph> {{title}}
            </span>
            <!-- Left Button Add-on -->
            <span class="input-group-btn" data-ng-show="type == 'btn' && side == 'left'" data-ng-click="{{asClick}}">
                <button class="btn btn-{{theme}}" type="button">
                    <glyph icon="{{icon}}" data-ng-show="icon"></glyph> {{title}}
                </button>
            </span>

            <!-- The input -->
            <input type="{{inputType}}" class="form-control" placeholder="{{placeholder}}">

            <!-- Right Span Add-on -->
            <span class="input-group-addon" data-ng-show="type == 'span' && side == 'right'" data-ng-click="{{asClick}}">
                <glyph icon="{{icon}}" data-ng-show="icon"></glyph> {{title}}
            </span>
            <!-- Right Button Add-on -->
            <span class="input-group-btn" data-ng-show="type == 'btn' && side == 'right'" data-ng-click="{{asClick}}">
                <button class="btn btn-{{theme}}" type="button">
                    <glyph icon="{{icon}}" data-ng-show="icon"></glyph> {{title}}
                </button>
            </span>
        </div>
        """
    ]
)
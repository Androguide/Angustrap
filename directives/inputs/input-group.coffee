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
            title: "@title"
            asType: "@asType"
            side: "@side"
            icon: "@icon"
            size: "@size"
            theme: "@theme"
            type: "@type"

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
)
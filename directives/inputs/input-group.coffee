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
# * `size`: Defines the size of the input-group. Accepted values are:
#   * `lg`
#   * `sm`
#  If none is specified, the medium size is used.
#
# * `icon`: Allows to define a glyphicon for the input add-on
#
# * `input-type`: The HTML5 `type` attribute of the `<input>` ("text", "tel", "number", "email", etc...)
#
# * `side`: Whether the add-on should be on the `left` or on the `right` of the `<input>`
#
# * `theme`: _Only valid for button input-groups (`<input-group type="btn">`)._
#     The variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
#     The stock ones are as follows _(but you can create your own in your stylesheet if you want using the `btn-` prefix)_:
#     * `primary`
#     * `success`
#     * `info`
#     * `warning`
#     * `danger`
angular.module("Angustrap").directive("inputGroup", ->
    restrict: "E"
    replace: true
    transclude: true
    templateUrl: "templates/inputs/input-group.html"
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

    controller: ($scope, CleanUp) ->
        $scope.sizeWildcard = "input-group-" unless !$scope.size
        CleanUp $scope
)
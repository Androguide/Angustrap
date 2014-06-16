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
#
# ### Button glyphicon
# **Attributes**:
#   - `icon`: the variable part of the Bootstrap 3.x glyphicons classes (i.e without the 'glyphicon-' prefix).
#             See [here](http://getbootstrap.com/components/#glyphicons-glyphs) for the full list.
#
#   - `theme`: the variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
#              The stock ones are as follows, but you can create your own in your stylesheet if you want:
#                * _primary_
#                * _success_
#                * _info_
#                * _warning_
#                * _danger_
#
#             _**Note**: If no `theme` attribute is specified, Angustrap will default-back to Bootstrap's `.btn-default` class_
#
#   - `size`: the variable part of the Bootstrap 3.x buttons size classes (i.e without the 'btn-' prefix).
#             Possible choice are:
#               * _lg_
#               * _sm_
#               * _xs_
#
angular.module("Angustrap", []).directive("btnGlyph", ($timeout) ->
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
            console.log el
            attrs.theme = attrs.theme or "default"

    return  defObj
)

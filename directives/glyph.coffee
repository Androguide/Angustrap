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
#
# ### Simple glyph icon (span)
# **Attributes**:
#   - icon: the variable part of the Bootstrap 3.x glyphicons classes (i.e without the 'glyphicon-' prefix).
#           See [here](http://getbootstrap.com/components/#glyphicons-glyphs) for the full list.
angular.module("Angustrap", []).directive("glyph", ->
    defObj =
        restrict: "E"
        replace: true
        template: "<span class=\"glyphicon glyphicon-{{icon}}\"></span>"
        scope:
            icon: "@icon"

    return defObj
)

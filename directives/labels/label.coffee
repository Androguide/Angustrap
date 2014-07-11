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
)
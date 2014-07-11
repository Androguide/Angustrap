# ### Alerts
# #### Attributes:
#  * theme: the variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
#     The stock ones are as follows _(but you can create your own in your stylesheet if you want using the `btn-` prefix)_:
#       * `primary`
#       * `success`
#       * `info`
#       * `warning`
#       * `danger`
#
# #### Examples:
# ```
# <alert theme="danger">Something ain't right!</alert>
# <alert theme="success">Props! You did it!</alert>
# ```

directive("alert", [ ->
        defObj =
            restrict: "E"
            replace: true
            transclude: true
            scope:
                theme: "@"

            template: '<div class="alert alert-{{theme}}" role="alert" data-ng-transclude></div>'

        return defObj
    ]
)
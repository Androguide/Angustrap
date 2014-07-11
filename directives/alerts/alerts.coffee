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
)
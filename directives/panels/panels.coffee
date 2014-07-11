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
)
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
# #### Examples:
# ```
# <!-- Green Progress Bar -->
# <progress-bar theme="success" current="95"></progress-bar>
#
# <!-- Red Progress Bar with label -->
#  <progress-bar theme="danger" title="Angustrap" current="75"></progress-bar>
# ```

directive("progressBar", [  ->
    restrict: "E"
    transclude: false
    replace: true
    scope:
        theme: "@"
        current: "@"
        title: "@"

    template: '
    <div class="progress">
      <div class="progress-bar progress-bar-{{theme}}" role="progressbar" aria-valuenow="{{current}}" aria-valuemin="0" aria-valuemax="100" style="width: {{current}}%">
        <span class="sr-only">{{title}}</span>
        {{title}}
      </div>
    </div'
])
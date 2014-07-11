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
#  * `striped`: _(Boolean)_ whether the progress-bar should be striped or not
#
#  * `animated`: _(Boolean)_ if the progress bar is `striped`, defined whether the progress-bar stripes should be animated
#
# #### Examples:
# ```
# <!-- Green Progress Bar -->
# <progress-bar theme="success" current="95"></progress-bar>
#
# <!-- Red Progress Bar with label -->
#  <progress-bar theme="danger" title="Angustrap" current="75"></progress-bar>
#
# <!-- Orange Striped Progress Bar with label -->
#  <progress-bar theme="warning" current="75" striped></progress-bar>
#
# <!-- Blue Animated Progress Bar with label -->
#  <progress-bar theme="warning" title="Angustrap" current="75" striped animated></progress-bar>
# ```

directive("progressBar", [  ->
    restrict: "E"
    transclude: false
    replace: true
    scope:
        theme: "@"
        current: "@"
        title: "@"
        striped: "@"
        animated: "@"

    template: '
    <div class="progress">
      <div class="progress-bar progress-bar-{{theme}} {{striped ? \'progress-bar-striped\' : \'\'}} {{animated ? \'active\' : \'\'}}" role="progressbar" aria-valuenow="{{current}}" aria-valuemin="0" aria-valuemax="100" style="width: {{current}}%">
        <span class="sr-only">{{title}}</span>
        {{title}}
      </div>
    </div'

    link: (scope, el, attrs) ->
        if attrs.striped is "" then attrs.striped = true
        if attrs.animated is "" then attrs.animated = true
])
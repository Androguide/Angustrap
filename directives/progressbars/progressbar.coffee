directive("progressBar", [  ->
    restrict: "E"
    transclude: false
    replace: true
    scope:
        theme: "@"
        currValue: "@"
        minValue: "@"
        maxValue: "@"
        asWidth: "@"
        asTitle: "@"
    template: """
    <div class="progress">
      <div class="progress-bar progress-bar-{{theme}}" role="progressbar" aria-valuenow="{{currValue}}" aria-valuemin="{{minValue}}" aria-valuemax="{{maxValue}}" style="width: {{asWidth}}%">
        <span class="sr-only">{{asTitle}}</span>
      </div>
    </div>
    """
])
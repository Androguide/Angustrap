service('CleanUp', ['$timeout', ($timeout) ->
        return (scope) ->
            $timeout ->
                if scope.asId
                    classes = $('#' + scope.asId).attr 'class'
                    $('#' + scope.asId).attr 'class', classes.trim()
            , 0
    ]
)

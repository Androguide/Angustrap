service('AsRandom', [ ->
        return (x) ->
            s = ""
            while s.length < x and x > 0
                r = Math.random()
                s += ((if r < 0.1 then ~~(r * 100) else String.fromCharCode(~~(r * 26) + ((if r > 0.5 then 97 else 65)))))
            return s
    ]
)
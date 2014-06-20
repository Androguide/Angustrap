# RainbowLog
# ----------
# Provides colored console output: https://github.com/Androguide/RainbowLog
(->
    r = (t) ->
        (r, i) ->
            e.log "%c" + r, i + ";color:#fff;background:" + n[1][t]
    e = console
    t = 3
    n = [
        ["e", "s", "i"],
        ["#c0392b", "#2ecc71", "#3498db"]
    ]
    e[n[0][t]] = r(t) while t--
    return)()
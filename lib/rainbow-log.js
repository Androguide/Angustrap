// Generated by CoffeeScript 1.6.3
(function() {
  (function() {
    var e, n, r, t;
    r = function(t) {
      return function(r, i) {
        return e.log("%c" + r, i + ";color:#fff;background:" + n[1][t]);
      };
    };
    e = console;
    t = 3;
    n = [["e", "s", "i"], ["#c0392b", "#2ecc71", "#3498db"]];
    while (t--) {
      e[n[0][t]] = r(t);
    }
  })();

}).call(this);

/*
//@ sourceMappingURL=rainbow-log.map
*/

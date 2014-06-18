// Generated by CoffeeScript 1.7.1
(function() {
  var app, bodyParser, errorHandler, express, methodOverride, port;

  express = require("express");

  app = express();

  bodyParser = require("body-parser");

  errorHandler = require("errorhandler");

  methodOverride = require("method-override");

  port = parseInt(process.env.PORT, 10) || 4567;

  app.get("/", function(req, res) {
    res.redirect("/index.html");
  });

  app.use(methodOverride());

  app.use(bodyParser());

  app.use(express["static"](__dirname + "/app"));

  app.use(errorHandler({
    dumpExceptions: true,
    showStack: true
  }));

  app.listen(port);

  console.log("Server listening on port: " + port);

}).call(this);

//# sourceMappingURL=server.map

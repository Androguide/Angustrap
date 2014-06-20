express = require("express")
app = express()
bodyParser = require("body-parser")
errorHandler = require("errorhandler")
methodOverride = require("method-override")

port = parseInt(process.env.PORT, 10) or 4567

app.get "/", (req, res) ->
    res.redirect "/index.html"
    return

app.use methodOverride()
app.use bodyParser()
app.use express.static(__dirname + "/dist")
app.use errorHandler(
    dumpExceptions: true
    showStack: true
)

app.listen port
console.log "Server listening on port: " + port
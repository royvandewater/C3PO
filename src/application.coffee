express         = require 'express'
morgan          = require 'morgan'
body_parser     = require 'body-parser'
errorhandler    = require 'errorhandler'
http            = require 'http'
path            = require 'path'
messages        = require './messages'

app = express()

app.use morgan 'dev'
app.use body_parser()
app.use express.static path.join(__dirname, '../public')

# development only
app.use errorhandler() if 'development' == app.get('env')

app.post '/', messages.create

port = process.env.PORT ? 3002
server = app.listen port, ->
  console.log "Express server listening on port #{server.address().port}"


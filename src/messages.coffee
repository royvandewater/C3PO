Bot = require './models/bot'

exports.create = (request, response) ->
  unless request.body.name == 'C3PO'
    bot = new Bot request.body
    bot.react request.body.text
  response.send null, 204




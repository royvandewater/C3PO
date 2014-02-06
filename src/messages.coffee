request = require 'request'
_       = require 'underscore'

triggers =
  ":decider:": "http://liveingreatness.com/core-protocols/decider/"

exports.create = (req, resp) ->
  _.each triggers, (answer, question) =>
    if req.body.text.match question

      request.post "https://api.groupme.com/v3/bots/post", json:
        bot_id: "a979eb3541834d6da88d1b2f58"
        text: answer

  resp.send null, 204




request = require 'request'
_       = require 'underscore'

triggers =
  ':pass:'              : 'http://liveingreatness.com/core-protocols/pass-unpass/'
  ':checkin:'           : 'http://liveingreatness.com/core-protocols/check-in/'
  ':checkout:'          : 'http://liveingreatness.com/core-protocols/check-out/'
  ':askforhelp:'        : 'http://liveingreatness.com/core-protocols/ask-for-help/'
  ':protocolcheck:'     : 'http://liveingreatness.com/core-protocols/protocol-check/'
  ':intentioncheck:'    : 'http://liveingreatness.com/core-protocols/intention-check/'
  ':decider:'           : 'http://liveingreatness.com/core-protocols/decider/'
  ':resolution:'        : 'http://liveingreatness.com/core-protocols/resolution/'
  ':perfectiongame:'    : 'http://liveingreatness.com/core-protocols/perfection-game/'
  ':personalalignment:' : 'http://liveingreatness.com/core-protocols/personal-alignment/'
  ':investigate:'       : 'http://liveingreatness.com/core-protocols/investigate/'

exports.create = (req, resp) ->
  _.each triggers, (answer, question) =>
    if req.body.text.match question

      request.post "https://api.groupme.com/v3/bots/post", json:
        bot_id: "a979eb3541834d6da88d1b2f58"
        text: answer

  resp.send null, 204




request = require 'request'
_       = require 'underscore'

bots =
  '248368'  : 'a979eb3541834d6da88d1b2f58'
  '6822939' : 'c4a5adca1f9fe104c15f431623'
  '4786257' : '795cd4ddb8b890fc028e07aecf'
  '5918963' : '0f2c30caf85c8451660c4afc55'

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

      request.post 'https://api.groupme.com/v3/bots/post', json:
        bot_id: bots[req.body.group_id]
        text: answer

  resp.send null, 204




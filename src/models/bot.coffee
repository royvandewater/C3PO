request   = require 'request'
_         = require 'underscore'
bots      = require '../data/bots'
protocols = require '../data/protocols'

GROUP_ME_URL = 'https://api.groupme.com/v3/bots/post'

class Bot
  constructor: (options={}) ->
    @bot_id = bots[options.group_id]

  for_each_response_to: (message, callback=->) =>
    _.each @tokens(message), callback

  post: request.post

  react: (message) =>
    @for_each_response_to message, @reply

  reply: (response) =>
    @post GROUP_ME_URL,
      json:
        bot_id: @bot_id
        text:   response

  tokens: (message) =>
    _.filter protocols, (value, key) => message.match key

module.exports = Bot

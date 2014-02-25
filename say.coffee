#!/usr/bin/env coffee
request = require 'request'
_       = require 'underscore'

request.post 'https://api.groupme.com/v3/bots/post', json:
  bot_id: 'c4a5adca1f9fe104c15f431623'
  text: _.last process.argv

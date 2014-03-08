#!/usr/bin/env coffee
request = require 'request'
_       = require 'underscore'


  # 'a979eb3541834d6da88d1b2f58' # Integrum
  # 'c4a5adca1f9fe104c15f431623' # Resellers
  # '795cd4ddb8b890fc028e07aecf' # GP Community Builders
  # '0f2c30caf85c8451660c4afc55' # Integrum Family
  # '392c7726a7ca4000d824e8b56c' # C3PO Test

request.post 'https://api.groupme.com/v3/bots/post', json:
  bot_id: '392c7726a7ca4000d824e8b56c'
  text: _.last process.argv

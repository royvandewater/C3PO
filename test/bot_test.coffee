{Bot} = require '../src/models/bot'

describe 'Bot', ->
  describe 'initialize', ->
    it 'should exist', ->
      expect(new Bot).to.exist

  describe 'react', ->
    beforeEach ->
      @bot = new Bot

    it 'should be callable', ->
      expect(@bot.react ':help:').not.to.exist




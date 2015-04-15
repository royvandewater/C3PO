Bot = require '../src/models/bot'

describe 'Bot', ->
  describe 'initialize', ->
    it 'should exist', ->
      expect(new Bot).to.exist

  describe 'react', ->
    describe 'when instantiated with a group id of "248368"', ->
      beforeEach ->
        @bot = new Bot group_id: '248368'
        sinon.stub @bot, 'post'

      describe 'when called with a message including the phrase ":help:"', ->
        it 'should call post', ->
          @bot.react ':help:'
          expect(@bot.post).to.have.been.calledWith 'https://api.groupme.com/v3/bots/post',
            json:
              bot_id: 'a979eb3541834d6da88d1b2f58'
              text:   "I respond to these options :pass:, :checkin:, :askforhelp:, :protocolcheck:, :intentioncheck:, :decider:, :resolution:, :perfectiongame:, :personalalignment:, :investigate:, :core:."

      describe 'when called with a message including the phrase ":askforhelp:"', ->
        it 'should call post', ->
          @bot.react 'something containing :askforhelp:'
          expect(@bot.post).to.have.been.calledWith 'https://api.groupme.com/v3/bots/post',
            json:
              bot_id: 'a979eb3541834d6da88d1b2f58'
              text:   'http://liveingreatness.com/core-protocols/ask-for-help/'

        it 'should call still post if the sentence is different', ->
          @bot.react 'something else containing :askforhelp:'
          expect(@bot.post).to.have.been.calledWith 'https://api.groupme.com/v3/bots/post',
            json:
              bot_id: 'a979eb3541834d6da88d1b2f58'
              text:   'http://liveingreatness.com/core-protocols/ask-for-help/'

      describe 'when called with a message containing two keywords', ->
        it 'should call post twice, once for each keyword', ->
          @bot.react ':help: :askforhelp:'
          expect(@bot.post).to.have.been.calledTwice


    # '6822939' : 'c4a5adca1f9fe104c15f431623' # Resellers
    describe 'when instantiated with a group id of "6822939"', ->
      beforeEach ->
        @bot = new Bot group_id: '6822939'
        sinon.stub @bot, 'post'

      it 'should resolve the correct bot_id', ->
        @bot.react ':help:'
        expect(@bot.post.firstCall.args[1].json.bot_id).to.equal 'c4a5adca1f9fe104c15f431623'

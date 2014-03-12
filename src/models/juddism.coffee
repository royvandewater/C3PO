request = require 'request'
_       = require 'underscore'

class Juddism
  @random: (callback=->) =>
    request 'http://juddisms.com/data/juddisms.json', (err, something, response) =>
      callback _.sample(JSON.parse(response).juddisms).quote

module.exports = Juddism

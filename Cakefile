{spawn}     = require 'child_process'
{watchTree} = require 'watch'

class Server
  restart: =>
    @process?.kill()
    @process = spawn 'npm', ['run']


task 'dev', 'rebuild the project', (options) ->
  spawn 'coffee', ['--output', 'lib', '--watch', '--compile', 'src'], stdio: 'inherit'

  server = new Server
  server.restart()
  watchTree 'lib', server.restart

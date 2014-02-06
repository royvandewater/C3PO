{spawn}     = require 'child_process'
{watchTree} = require 'watch'
_           = require 'underscore'

task 'dev', 'rebuild the project', (options) ->
  spawn 'coffee', ['--output', 'lib', '--watch', '--compile', 'src'], stdio: 'inherit'
  spawn 'npm',    ['start'], stdio: 'inherit'

# task 'dev', 'rebuild the project', (options) ->
#   spawn 'coffee', ['--output', 'lib',  '--watch', '--compile', 'src'],  stdio: 'inherit'
#   spawn 'nodemon', ['lib/index.js'], stdio: 'inherit'

#   runTests = _.throttle (=> spawn 'npm', ['test'], stdio: 'inherit'), 100, trailing: false

#   watchTree 'src', runTests
#   watchTree 'test', runTests

{spawn}     = require 'child_process'
{watchTree} = require 'watch'
nodemon     = require 'nodemon'
_           = require 'underscore'

TEST_ARGS = [
  "--compilers", "coffee:coffee-script/register"
  "--require", "coffee-script"
  "--require", "test/test_helper.coffee"
  "--growl"
]

run_tests = (arg1) ->
  return if _.isObject arg1
  spawn 'mocha', TEST_ARGS, stdio: 'inherit'

task 'test', 'rebuild the project', (options) ->
  run_tests()

task 'dev', 'watch sources and run tests', ->
  nodemon
    ext: 'coffee'
    script: 'src/application.coffee'
    verbose: true
  watchTree 'src', run_tests
  watchTree 'test', run_tests
  run_tests()

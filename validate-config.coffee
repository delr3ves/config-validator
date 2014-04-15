require('better-require')();
path = require 'path'
fs = require 'fs'
Parser = require './lib/parsing/MultiTypeParser.coffee'
Validator = require './lib/validation/ConfigValidator.coffee'

argv = require('optimist')
  .usage('Usage: $0 -config <config file location> -schema <config schema location>')
  .demand(['config','schema'])
  .argv

parseFile = (file) ->
    parser = new Parser()
    return parser.parse(path.resolve(file))

config = parseFile(argv.config)
schema = parseFile(argv.schema)

validator = new Validator(schema)
validator.validate(config)


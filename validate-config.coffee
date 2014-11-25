require('better-require')();
path = require 'path'
FileLoader = require './lib/loader/ConfigFileLoader.coffee'
Validator = require './lib/validation/ConfigValidator.coffee'
Q = require('q')

argv = require('optimist')
  .usage('Usage: $0 -config <config file location> -schema <config schema location>')
  .demand(['config', 'schema'])
  .argv

parseFile = (file) ->
  configLoader = new FileLoader()
  return configLoader.load(file)

configPromise = parseFile(argv.config)
schemaPromise = parseFile(argv.schema)
Q.all([configPromise, schemaPromise])
  .then((configAndSchema) ->
    validator = new Validator(configAndSchema[1])
    validator.validate(configAndSchema[0])
  )
  .catch((err)->
    exit -1
  )



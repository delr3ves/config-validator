require('better-require')();
Parser = require '../parsing/MultiTypeParser.coffee'
path = require 'path'
Q = require('q')

ConfigFileLoader = (parser) ->
  parser = parser || new Parser()

  return {
    load: (file) ->
      return Q.resolve(parser.parse(path.resolve(file)))
  }

module.exports = ConfigFileLoader
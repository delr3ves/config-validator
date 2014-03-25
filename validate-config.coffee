require('better-require')();
path = require('path')
fs = require('fs')
Parser = require('./lib/parsing/MultiTypeParser.coffee')
argv = require('optimist')
  .usage('Usage: $0 -config <config file location> -schema <config schema location>')
  .demand(['config','schema'])
  .argv

parseFile = (file) ->
    parser = new Parser()
    return parser.parse(path.resolve(file))


console.log(parseFile(argv.config))
console.log(parseFile(argv.schema))
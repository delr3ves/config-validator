require('better-require')();
path = require('path')

MultiTypeParser = () ->
  parseDefault = (file) ->
    return require(file)

  parseXml = (file) ->
    json = require(file)
    parsed = JSON.parse(json)
    keys = Object.keys(parsed)
    if (keys.length == 1)
      parsed = parsed[keys[0]]
    return parsed

  availableMymes = [".json", ".xml", ".yaml"]
  parserMatrix= {
    '.xml': parseXml,
    '.json': parseDefault,
    '.yaml': parseDefault
  }
  multiTypeParse = (file) ->
    mimeType = path.extname(file)
    isValidFileType = availableMymes.some (type) -> ~mimeType.indexOf type
    if isValidFileType
      return parserMatrix[mimeType](file)
    else
      console.log(mimeType)

  return {
    availableMymes: availableMymes,
    parse: multiTypeParse
  }

module.exports = MultiTypeParser
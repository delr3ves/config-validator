ConfigValidator = (schema) ->
  validate(config) ->
    console.log()
  return {
    validate: validate
  }

module.exports = ConfigValidator
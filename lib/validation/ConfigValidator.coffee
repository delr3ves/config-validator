SimpleFieldValidator = require './SimpleFieldValidator.coffee'


ConfigValidator = (schema, fieldValidator) ->
  fieldValidator = fieldValidator || new SimpleFieldValidator

  validateSimpleFields = (config) ->
    fields = schema.fields
    fieldValidator.validate config[field], validationInfo for field, validationInfo of fields

  validate = (config) ->
    validateSimpleFields(config)

  return {
    validate: validate
  }

module.exports = ConfigValidator
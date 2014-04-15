Validator = require 'validator'
SimpleFieldValidator = (validator) ->

  validator = validator || Validator


  getValidator = (type) ->
    customValidations = {
      'String': (value) -> return typeof value == 'string'
      'Object': (value) -> return typeof value == 'Object'
    }

    if typeof customValidations[type] == 'function'
      return customValidations[type]
    else if typeof validator['is'+type] == 'function'
      return validator['is'+type]
    else
      return () ->
        console.warn("Not found validator for type: " + type)


  validate = (field, validations) ->
    validatorFunction = getValidator(validations.type)
    console.log(validatorFunction(field))

  return {
    validate: validate
  }

module.exports = SimpleFieldValidator
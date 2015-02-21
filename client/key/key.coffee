Ctrl.define
  'key':
    api:
      isPressed: (value) -> @prop 'isPresses', value, default:false

    helpers:
      actual: (value) -> @prop 'actual', value

      modifiers: ->
        classes = ""
        classes += "-pressed" if @api.isPressed()
        classes

Ctrl.define
  'key':
    api:
      isPressed: (value) -> @prop 'isPresses', value, default:false

    helpers:
      modifiers: ->
        classes = ""
        classes += "-pressed" if @api.isPressed()
        classes

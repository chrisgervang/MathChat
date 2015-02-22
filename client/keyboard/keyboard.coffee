keycodes = [
  [192, 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 189, 187, 8]
]

combine = (keyboards) ->
  newKeyboard = {}

  for mode, keyboard of keyboards
    newMode = newKeyboard[mode] = []

    for row, i in keyboard
      newMode.push []

      for key, j in row
        newObj = {}
        newObj.code = keycodes[i][j]
        newObj.func = key
        newObj.id = "key-#{keycodes[i][j]}"
        newMode[i].push newObj

  newKeyboard


Ctrl.define
  'keyboard':
    ready: ->
      children = @children

      Util.keyboard.keyDown (e) =>

        if e.which is 16
          @api.keyboardMode('shift')

        children["key-#{e.which}"]?.isPressed(true)
        # e.preventDefault()

      Util.keyboard.keyUp (e) =>

        if e.which is 16
          @api.keyboardMode('math')

        children["key-#{e.which}"]?.isPressed(false)

    api:
      keyboardMode: (value) -> @prop 'keyboardState', value, default:'math'

    helpers:
      combined: -> combine(@data.customKeyboard)
      keys: -> @helpers.combined()[@api.keyboardMode()]

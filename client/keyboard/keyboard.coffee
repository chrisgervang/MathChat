keycodes = [
  [192, 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 189, 187, 8],
  [9, 81, 87, 69, 82, 84, 89, 85, 73, 79, 80, 219, 221, 220],
  [20, 65, 83, 68, 70, 71, 72, 74, 75, 76, 186, 222, 13],
  [16, 90, 88, 67, 86, 66, 78, 77, 188, 190, 191, 16],
  [999, 17, 18, 91, 32, 93, 18, 37, 38, 40, 39]
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

      # @autorun =>
      #   foo = @api.keyboardMode()
      #   $('.key .letter.-symbol').html()


      children = @children

      Util.keyboard.keyDown (e) =>

        if e.which is 20
          @api.keyboardMode('math')

        if e.which is 16 and children["key-20"]?.isPressed()
          @api.keyboardMode('shift')

        children["key-#{e.which}"]?.isPressed(true)

        if @api.keyboardMode() isnt 'default'

          # dunno why this isnt eching the text, but this should be it.
          console.log children["key-#{e.which}"]?.func()

          e.preventDefault()

      Util.keyboard.keyUp (e) =>

        if e.which is 20
          @api.keyboardMode('default')

        if e.which is 16 and children["key-20"]?.isPressed()
          @api.keyboardMode('math')

        children["key-#{e.which}"]?.isPressed(false)

    api:
      keyboardMode: (value) -> @prop 'keyboardState', value, default:'default'

    helpers:
      combined: -> combine(@data.customKeyboard)
      keys: -> @helpers.combined()[@api.keyboardMode()]

actualKeys =
  192: '`'
  49: 1
  50: 2
  51: 3
  52: 4
  53: 5
  54: 6
  55: 7
  56: 8
  57: 9
  48: 0
  189: '-'
  187: '='
  8: 'delete'

funcSymbols =
  foo:
    symbol: 'f'
  bar:
    symbol: 'b'


Ctrl.define
  'key':
    ready: ->

      @autorun =>
        if @api.isPressed()
          $(".key-#{@api.code()}").addClass('-pressed')
        else
          $(".key-#{@api.code()}").removeClass('-pressed')

    api:
      isPressed: (value) -> @prop 'isPressed', value, default:false

      code: (value) -> @prop 'code', value
      func: (value) -> @prop 'func', value

    helpers:
      actual: -> actualKeys[@api.code()]
      symbol: -> funcSymbols[@api.func()].symbol

      modifiers: ->
        classes = ""
        # classes += "-pressed" if @api.isPressed()
        classes

keyboard = [
  [
    symbol: '`'
    id: 'key-192'
    code: 192
  ,
    symbol: '1'
    id: 'key-49'
    code: 49
  ,
    symbol: '2'
    id: 'key-50'
    code: 50
  ,
    symbol: '3'
    id: 'key-51'
    code: 51
  ,
    symbol: '4'
    id: 'key-52'
    code: 52
  ,
    symbol: '5',
    id: 'key-53'
    code: 53
  ,
    symbol: '6'
    id: 'key-54'
    code: 54
  ,
    symbol: '7'
    id: 'key-55'
    code: 55
  ,
    symbol: '8'
    id: 'key-56'
    code: 56
  ,
    symbol: '9'
    id: 'key-57'
    code: 57
  ,
    symbol: '0'
    id: 'key-48'
    code: 48
  ,
    symbol: '-'
    id: 'key-189'
    code: 189
  ,
    symbol: '='
    id: 'key-187'
    code: 187
  ,
    symbol: 'delete'
    id: 'key-8'
    code: 8
  ]
]



Ctrl.define
  'keyboard':
    ready: ->

      children = @children

      Util.keyboard.keyDown (e) =>
        children["key-#{e.which}"]?.isPressed(true)
        e.preventDefault()

      Util.keyboard.keyUp (e) =>
        children["key-#{e.which}"]?.isPressed(false)

    helpers:
      keyboard: -> keyboard

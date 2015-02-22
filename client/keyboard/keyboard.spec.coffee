describe 'Keyboard', ->

  after -> @reset()
  before ->

    data =

      customKeyboard:
        math: [
          ['foo', 'bar','foo', 'bar','foo', 'bar','foo', 'bar','foo', 'bar','foo', 'bar','foo', 'bar']
        ]
        shift: [
          ['bar','foo', 'bar','foo', 'bar','foo', 'bar','foo', 'bar','foo', 'bar','foo', 'bar', 'foo']
        ]

    @load 'keyboard', size: '800, auto', align: 'center, bottom', background: 0.1, args: { data:data }

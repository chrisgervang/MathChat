describe 'Keyboard', ->

  after -> @reset()
  before ->

    data = 'foo'

    @load 'keyboard', size: '800, auto', align: 'center, bottom', background: 0.1, args: { data:data }

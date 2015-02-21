describe 'Key', ->

  after -> @reset()
  before ->

    data =
      actual: 'w'

    @load 'key', size: '50, auto', align: 'center, middle', background: 0.1, args: { data:data }


  describe.section 'api', ->
    it '`isPressed`', ->
      @ctrl().isPressed(true)

      ctrl = @ctrl()
      Util.delay 100, ->
        ctrl.isPressed(false)

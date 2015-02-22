Ctrl.define
  'chat-view':
    ready: ->

      Util.delay 10, ->
        $('.chat-inbox').focus()
        # $('html, body').animate({scrollTop:$(document).height()}, 'slow');
        $('html, body').animate({scrollTop:$(document).height()});

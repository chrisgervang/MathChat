if Meteor.isClient
  # counter starts at 0
  Session.setDefault('counter', 0)

  Template.hello.helpers
    counter: () ->
      return Session.get('counter')
    variable: () ->
      return Session.get('variable')
    cursorScript: () ->
      if Session.get('cursor')
        console.log "#MathJax-Span-#{Session.get('cursor').mathId}"
        #document.getElementById("MathJax-Span-#{Session.get('cursor').mathId}").style.backgroundColor = "cyan"
        $("span").removeClass('selected')
        $("#MathJax-Span-#{Session.get('cursor').mathId}").addClass('selected')
      return ""
      
  Template.hello.events
    'click button': () ->
      # increment the counter when button is clicked
      Session.set('counter', Session.get('counter') + 1)
    "click span[id*='MathJax-Span-']": (event, plate) ->
      console.log "i'm clicked! #{event.currentTarget.id}"
      console.log event.currentTarget
      mathId = event.currentTarget.id.slice( 13 ) * 1
      cursor = Session.get 'cursor'
      cursorAge = 999 
      cursorId = 0 
      if cursor 
        cursorId = cursor.mathId
        cursorAge = Date.now() - cursor.createTime
      console.log cursorAge
      if ( cursorAge > 100 ) || ( cursorAge < 100 && mathId > cursorId )
        Session.set 'cursor', { createTime: Date.now(), mathId: mathId }
      console.log Session.get 'cursor'

  Template.body.events
    'keydown': (event, plate) ->
      console.log "howdy key"
      console.log event.which
      if event.which == 8
        event.preventDefault()
      if 37 <= event.which <= 40 || event.which == 8
        cursor = Session.get('cursor')
        if cursor
          if event.which == 37
            event.preventDefault()
            newMathId = cursor.mathId - 1
            if newMathId < 1 then newMathId = 1
            Session.set 'cursor', {createTime: Date.now(), mathId: newMathId}
          if event.which == 39
            event.preventDefault()
            newMathId = cursor.mathId + 1
            #if newMathId > ?? then newMathId = ??
            Session.set 'cursor', {createTime: Date.now(), mathId: newMathId}
          if event.which == 8
            event.preventDefault()
            #do a delete
            $("#MathJax-Span-#{cursor.mathId}").remove()
            newMathId = cursor.mathId - 1
            if newMathId < 1 then newMathId = 1
            Session.set 'cursor', {createTime: Date.now(), mathId: newMathId}
        #console.log event.which
        #setTimeout (() ->
        #  Session.set 'retrieve', $('.search-box').val()  
        #  ), 100

if Meteor.isServer
  Meteor.startup( () ->
    # code to run on server at startup
  )
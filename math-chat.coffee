if Meteor.isClient
  # counter starts at 0
  Session.setDefault('counter', 0)
  Session.setDefault('theMath', """
      <mtext> When </mtext>
      <math>
        <mi>a</mi><mo>&#x2260;</mo><mn>0</mn>
      <mtext> ,
      there are two solutions to </mtext>
     
        <mi>a</mi><msup><mi>x</mi><mn>2</mn></msup>
        <mo>+</mo> <mi>b</mi><mi>x</mi>
        <mo>+</mo> <mi>c</mi> <mo>=</mo> <mn>0</mn>
      
      <mtext> and they are </mtext>
     
        <mi>x</mi> <mo>=</mo>
        <mrow>
          <mfrac>
            <mrow>
              <mo>&#x2212;</mo>
              <mi>b</mi>
              <mo>&#x00B1;</mo>
              <msqrt>
                <msup><mi>b</mi><mn>2</mn></msup>
                <mo>&#x2212;</mo>
                <mn>4</mn><mi>a</mi><mi>c</mi>
              </msqrt>
            </mrow>
            <mrow> <mn>2</mn><mi>a</mi> </mrow>
          </mfrac>
        </mrow>
        <mtext>.</mtext>
      </math>
      """)

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
    theMath: () ->
      return Session.get 'theMath'
      
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

            #do the translation, rerender
            console.log $(".test")
            buildMML = (MML, element) ->
              #element open tag
              mathClass = element.attr 'class'
              tag = switch
                when mathClass == "math" then "math"
                when mathClass == "mrow" then "mrow"
                when mathClass == "mi" then "mi"
                when mathClass == "mo" then "mo"
                when mathClass == "mn" then "mn"
                when mathClass == "mtext" then "mtext"
                when mathClass == "mfrac" then "mfrac"
                when mathClass == "msqrt" then "msqrt"
                when mathClass == "msup" then "msup"
                when mathClass == "msub" then "msub"
                else null
              if tag?
                MML = MML + "<#{tag}>"
              for child in element.children()
                MML = buildMML MML, $(child) 
              if tag?
                contents = ""
                if tag == "mi" || tag == "mo" || tag == "mn" || tag == "mtext"
                  contents = element.contents().first().text()#[0]#.text#.wholeText
                  console.log contents
                #console.log contents
                #contString = ""
                #for p of contents
                #  console.log p
                #  #if (contents.hasOwnProperty(p))
                #  #    contString += p + '::' + contents[p] + '\n'
                #console.log contString
                return MML = MML + contents + "</#{tag}>"
              else 
                return MML
            newMML = buildMML "", $(".test")
            $(".test").empty()
            Session.set('theMath', newMML)
            setTimeout (() ->
              MathJax.Hub.Queue(["Typeset",MathJax.Hub])  
              ), 10
            
        #console.log event.which
        #setTimeout (() ->
        #  Session.set 'retrieve', $('.search-box').val()  
        #  ), 100

if Meteor.isServer
  Meteor.startup( () ->
    # code to run on server at startup
  )




















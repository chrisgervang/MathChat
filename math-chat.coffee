if Meteor.isClient
  # counter starts at 0
  Session.setDefault('counter', 0)
  Session.setDefault('elementCount', 0)
  Session.setDefault('theMath1', """
      <math>
        <mi>a</mi><mo>&#x2260;</mo><mn>0</mn>
      </math>
      """)
  Session.setDefault('theMath2', """
      <math>
        <mrow>
          <mi>a</mi><msup><mi>x</mi><mn>2</mn></msup>
          <mo>+</mo> <mi>b</mi><mi>x</mi>
          <mo>+</mo> <mi>c</mi> <mo>=</mo> <mn>0</mn>
        </mrow>
      </math>
      """)
  Session.setDefault('theMath3', """
      <math>
        <mi>x</mi> <mo>=</mo>
        <mrow>
          <mfrac>
            <mrow>
              <mo>&#x2212;</mo>
              <mi>b</mi>
              <mo>&#x00B1;</mo>
              <msqrt>
                <mrow>
                  <msup><mi>b</mi><mn>2</mn></msup>
                  <mo>&#x2212;</mo>
                  <mn>4</mn><mi>a</mi><mi>c</mi>
                </mrow>
              </msqrt>
            </mrow>
            <mrow> <mn>2</mn><mi>a</mi> </mrow>
          </mfrac>
        </mrow>
      </math>
      """)
  setTimeout (() -> #i forget what the appropriate event is for rendered
    $("#text-1").val("When")
    $("#text-2").val(", there are two solutions to")
    $("#text-3").val("and they are")
    ), 100
  

  transpile = ( action ) ->
    #translate from dom tree to mml
    buildMML = (MML, previousTag, element) ->
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
      useTag = tag? && !(tag == "mrow" && previousTag == "mrow")
      if useTag
        MML = MML + "<#{tag}>"
      for child in element.children()
        MML = buildMML MML, tag, $(child) 
      if useTag
        contents = ""
        if tag == "mi" || tag == "mo" || tag == "mn" || tag == "mtext"
          contents = element.contents().first().text()
        return MML = MML + contents + "</#{tag}>"
      else 
        return MML
    #locate the math container to translate
    cursorId = Session.get('cursor').mathId
    equationField = MathJax.Hub.getJaxFor("MathJax-Span-#{cursorId}").inputID
    fieldId = equationField.slice( 16 ) * 1
    #translate it
    newMML = buildMML "", "", $("##{equationField}-Frame")

    

    #prepare retun the cursor where it was, given new ids from render
    mathContainer = $("##{equationField}-Frame").parent()
    containerId = mathContainer.attr('id').slice( 5 ) *1
    oldId = Session.get('cursor').mathId
    lowestIdinField = 9999
    $("#math-#{containerId}").find("span[id*='MathJax-Span-']").each( (i, element) ->
      if $(element).attr('id').slice( 13 ) * 1 < lowestIdinField then lowestIdinField = $(element).attr('id').slice( 13 ) * 1
    )
    highestIdinDoc = 0
    $("span[id*='MathJax-Span-']").each( (i, element) ->
      if $(element).attr('id').slice( 13 ) * 1 > highestIdinDoc then highestIdinDoc = $(element).attr('id').slice( 13 ) * 1
    )
    console.log "old id = #{oldId}"
    console.log "lowest in field = #{lowestIdinField}"
    console.log "highestIdinDoc = #{highestIdinDoc}"
    newCursorId = oldId - lowestIdinField + highestIdinDoc + 1
    if action == "insert"
      newCursorId++
    #else action == "delete"

    #empty the math container
    mathContainer.empty()
    #set result as new MML for container, triggeringa  render
    Session.set("theMath#{containerId}", newMML)

    #set the cursor after mathjax has rendered
    MathJax.Hub.Register.MessageHook "New Math", (message) -> 
      Session.set 'cursor', { createTime: Date.now(), mathId: newCursorId }
    #render
    setTimeout (() ->
      MathJax.Hub.Queue(["Typeset",MathJax.Hub])  
      ), 10

  countMathElements = () ->
    #count = 0
    #$("span[id*='MathJax-Span-']").each( (i, element) ->
    #  count++
    #)
    #Session.set 'elementCount', count
    count = $("span[id*='MathJax-Span-']").length
    return count

  Template.hello.helpers
    counter: () ->
      return Session.get('counter')
    variable: () ->
      return Session.get('variable')
    cursorScript: () ->
      if Session.get('cursor')
        $("span").removeClass('selected')
        $("#MathJax-Span-#{Session.get('cursor').mathId}").addClass('selected')
      return ""
    theMath1: () ->
      return Session.get 'theMath1'
    theMath2: () ->
      return Session.get 'theMath2'
    theMath3: () ->
      return Session.get 'theMath3'
      
  Template.hello.events
    'click button': () ->
      # increment the counter when button is clicked
      Session.set('counter', Session.get('counter') + 1)
      countMathElements()
    "click span[id*='MathJax-Span-']": (event, plate) ->
      mathId = event.currentTarget.id.slice( 13 ) * 1
      cursor = Session.get 'cursor'
      cursorAge = 999 
      cursorId = 0 
      if cursor 
        cursorId = cursor.mathId
        cursorAge = Date.now() - cursor.createTime
      if ( cursorAge > 100 ) || ( cursorAge < 100 && mathId > cursorId )
        Session.set 'cursor', { createTime: Date.now(), mathId: mathId }
      console.log event.currentTarget
      console.log Session.get 'cursor'
    'focus': (event, plate) ->
      $("span").removeClass('selected')

  Template.body.events
    'keydown': (event, plate) ->
      console.log "howdy, key #{event.which} pressed"
      console.log $(":focus")
      if event.which == 8 && !($(":focus").length > 0)
        event.preventDefault()
      if 37 <= event.which <= 40 || event.which == 8
        cursor = Session.get('cursor')
        if cursor && !($(":focus").length > 0)
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
            transpile()
      
            

      switch event.which
        when 88
          cursor = Session.get('cursor')
          $("span").removeClass('selected')
          $("#MathJax-Span-#{cursor.mathId}").after("""<span class="mi" id="MathJax-Span-#{cursor.mathId + 0.5}" style="font-family: MathJax_Math-italic;">x</span>""")
          transpile("insert")
        when 187 then 
        when 191 then 
        when 189 then
        when 66 then 
            

if Meteor.isServer
  Meteor.startup( () ->
    # code to run on server at startup
  )




















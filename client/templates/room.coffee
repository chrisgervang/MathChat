# Template helpers
Template.room.helpers
  # Find the room name from the Rooms collection by room id.
  roomName : ->
    room = Rooms.findOne Session.get "roomId"
    room ?= name : "Current Room"
    room.name
  # Retrieve the users sorted by username.
  # The UserPresences collection will only contain relevant room users since the server publishes by roomId.
  roomUsers : ->
    UserPresences.find {}, sort : "data.username":1
  # Find the messages in the room by room id.
  # Like UserPresences, the Messages collection subscribed to only contains messages associated with the current roomId.
  messages : ->
    Messages.find {}, sort : creation_date : 1
  playgroundContent : ->
    hover = Meteor.user().hoverEquation
    console.log Meteor.user()
    return hover
  hoverSearch : ->
    url = "http://www.wolframalpha.com/input/?"
    query = "i="+encodeURIComponent(Meteor.user().hoverSearch)
    url+query

# Template events
Template.room.events =
  # Create a message on form submit.
  # Note: It is recommended to use 'submit' instead of 'click' since it will handle all submit cases.
  "click span[id*='MathJax-Element-']": (event, plate) ->
      console.log event.currentTarget
      $elem = $(event.currentTarget).attr('id')
      $elem = $elem.replace("-Frame", "")
      $mathml =  $("[id='"+$elem+"']")
      console.log $mathml
      console.log $($mathml).html()
      mathmloriginal = $($mathml).html()
      mathmlfinal = mathmloriginal.replace("<math>", "<math xmlns='http://www.w3.org/1998/Math/MathML'>")
      Meteor.call "renderToWolfram", mathmlfinal
  "submit [data-action=create-message]" : (event, template) ->
    event.preventDefault()
    $message = $("[data-value=create-message]")
    $nummath = $(".math-text").length
    for i in [1..$nummath] by 1
      math = Session.get ('theMath'+i)
      console.log math
    string = ""
    for $child in $(".chat-inbox").children()
      if $($child).is("input")
        string+="<text style='padding-left:5px; padding-right:5px;'>"
        string+=$($child).val()
        string+="</text>"
        console.log $($child).val()
      if $($child).is("span")
        number = $($child).attr('id')
        number = number.substring(number.indexOf('-')+1)
        console.log number
        string+=Session.get ('theMath'+number)
      console.log string
    if string is "" then return
    # Call the Meteor.method function on the server to handle putting it into the messages collection.
    Meteor.call "createMessage",
      roomId : Session.get "roomId"
      message : string
    # Clear the form
    $(".chat-inbox").empty()
    $(".chat-inbox").append("<input type='text' class='common-text' id='text-1'>")

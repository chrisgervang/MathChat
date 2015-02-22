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
      # Meteor.call "renderToWolfram", mathmlfinal

window.Transponder =
  buildEvent: (array) ->
    eventType = array.filter (val) -> typeof val isnt 'undefined' and val isnt null
    eventType.join(':')

  init: ->
    Transponder.eh = new Transponder.Error()
    Transponder.req = new Transponder.Request()
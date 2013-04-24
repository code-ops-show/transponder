window.Transponder =
  buildEvent: (array) ->
    eventType = array.filter (val) -> val != null
    eventType.join(':')

  init: ->
    Transponder.eh = new Transponder.Error()
    Transponder.req = new Transponder.Request()


new Transponder.init()
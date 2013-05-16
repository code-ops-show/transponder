class Transponder.Error
  response: null

  constructor: ->
    doc = $(document)
    doc.ajaxError(@handleError)

  handleError: (event, xhr, settings, error) ->
    unless xhr.responseText is ""
      @response = JSON.parse(xhr.responseText) 
      eventType = Transponder.buildEvent ['ujs', @response.namespace, @response.controller, @response.action]
      $(document).trigger(eventType, @response)

# class Transponder.InvalidService
#   @message = message
#   @name = "InvalidService"
class Transponder.Service
  serviceName: null
  element: null
  module: null

  constructor: (element, message = {}) ->
    throw new Transponder.InvalidService('no service name specified.') unless @serviceName?
    @element = $(element)
    @element.addClass("#{this.serviceName}_active")
    @serve(message)
    
  serve: ->


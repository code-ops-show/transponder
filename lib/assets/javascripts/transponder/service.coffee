class Transponder.Service
  serviceName: null
  element: null
  module: null

  constructor: ->
    throw new Transponder.InvalidService('no service name specified.') unless @serviceName?
    _this = this
    serviceEvent = "#{_this.module}:services:#{_this.serviceName}"
    $(document).on serviceEvent, (e) ->
      service = _this.serviceName
      $(".#{service}:not(#{service}_active)").each (i, e) ->
        _this.element = $(this)
        _this.element.addClass("#{service}_active")
        _this.serve()


  serve: ->


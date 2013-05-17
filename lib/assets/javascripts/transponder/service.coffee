class Transponder.Service
  serviceName: null
  element: null

  constructor: ->
    throw new Transponder.InvalidService('no service name specified.') unless @serviceName?
    _this = this
    $(document).on _this.serviceName, (e) ->
      service = _this.serviceName.split(':').pop()
      $(".#{service}:not(#{service}_active)").each (i, e) ->
        _this.element = $(this)
        _this.element.addClass("#{service}_active")
        _this.serve()

  serve: ->


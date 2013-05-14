class Transponder.Service
  serviceName: null

  constructor: ->
    throw new Transponder.InvalidService('no service name specified.') unless @serviceName?
    _this = this
    $(document).on _this.serviceName, (e) ->
      service = _this.serviceName.split(':').pop()
      $(".#{service}:not(#{service}_active").each ->
        $(this).addClass("#{service}_active")
        _this.serve()

  serve: ->


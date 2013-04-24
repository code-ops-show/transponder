class Transponder.Service
  serviceName: ''

  constructor: ->
    _this = this
    $(document).on _this.serviceName, (e) ->
      service = _this.serviceName.split(':').pop()
      $(".#{service}:not(#{service}_active").each ->
        $(this).addClass("#{service}_active")
        _this.serve()

  serve: ->


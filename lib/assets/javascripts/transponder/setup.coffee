window.Transponder =
  buildEvent: (array) ->
    eventType = array.filter (val) -> typeof val isnt 'undefined' and val isnt null
    eventType.join(':')

  init: ->
    Transponder.eh = new Transponder.Error()
    Transponder.req = new Transponder.Request()
    Transponder.res = new Transponder.Response()

  buildServicesFor: (services) ->
    serviceEvents = []
    for _, service of services
      serviceEvents.push("#{service::module}:services:#{service::serviceName}") 

    $(document).on serviceEvents.join(' '), (e, message = {}) ->
      [module, _, service] = e.type.split(':')
      $(".#{service}:not(#{service}_active)").each (i, f) ->
        for _, fun of services
          if fun::serviceName is service and fun::module is module
            new fun(this, message)
        
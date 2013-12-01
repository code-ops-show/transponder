class Transponder.Response
  payload: {}

  constructor: ->
    $(document).on 'ajax:complete', (event, xhr, status) =>
      if xhr.getResponseHeader('Content-Type') is 'application/transmission'
        @payload.raw = JSON.parse(xhr.responseText)
        element    = @payload.raw[0]
        event_name = @payload.raw[1]
        content    = @payload.raw[2]

        $(element).trigger(event_name, content)

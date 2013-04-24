class Transponder.Request
  url: ''

  constructor: ->
    $(document).on 'ajax:beforeSend', (event, xhr, settings) =>
      @url = ''
      @url = settings.url

  objectifyParams: ->
    if @url.split('?').length is 2
      JSON.parse('{"' + @url.split('?')[1].replace(/&/g, "\",\"").replace(/\=/g,"\":\"") + '"}')
    else
      {}
class Transponder.Presenter
  actions: ['new', 'index', 'show', 'update', 'edit', 'create', 'destroy']
  params: {}

  presenterName: null
  nameSpace: null
  modelName: null

  element: null
  response: null

  constructor: (options = {}) ->
    options.presenterName = @presenterName  unless options.presenterName
    options.nameSpace =     @nameSpace      unless options.nameSpace
    options.actions =       @actions        unless options.actions

    doc = $(document)
    events = []
    for action in options.actions
      events.push(Transponder.buildEvent(['ujs', options.nameSpace, options.presenterName, action]))
    doc.on(events.join(' '), @runAction)

  elify: (event, response) ->
    if @response.errors
      if @response.id then "##{@modelName}_#{@response.id}" else "#new_#{@modelName}"
    else 
      "#{event.target.localName}##{event.target.id}"

  beforeFilter: (event, response) ->
    @response = response
    @element = @elify(event, response)
    @params = Transponder.req.objectifyParams()

  runAction: (event, response) =>
    @beforeFilter(event, response)
    if @response.errors
      @errorOut()
    else    
      @[event.type.split(':').pop()]()
    @afterFilter(event, response)

  afterFilter: (event, response) ->


  triggerEmpty: (eventName) ->
    console.log "#{eventName} triggered! Override this action in your own controller"

  errorOut: ->
    console.log "an error has occured!"

  index: ->
    @triggerEmpty('Index')
  show: ->
    @triggerEmpty('Show')
  new: ->
    @triggerEmpty('New')
  edit: ->
    @triggerEmpty('Edit')
  update: ->
    @triggerEmpty('Update')
  create: ->
    @triggerEmpty('Create')
  destroy: ->
    @triggerEmpty('Destroy')
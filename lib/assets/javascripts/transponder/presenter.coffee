class Transponder.Presenter
  actions: ['new', 'index', 'show', 'update', 'edit', 'create', 'destroy']
  params: {}

  presenterName: null
  module: null
  modelName: null

  element: null
  response: null

  constructor: (options = {}) ->
    options.presenterName = @presenterName  unless options.presenterName
    options.module =        @module         unless options.module
    options.actions =       @actions        unless options.actions

    doc = $(document)
    events = []
    for action in options.actions
      events.push(Transponder.buildEvent(['ujs', options.module, options.presenterName, action]))
    doc.on(events.join(' '), @runAction)

  elify: (event, response) ->
    if @response.errors
      if @response.id then "##{@response.model_name}_#{@response.id}" else "#new_#{@response.model_name}"
    else 
      "#{event.target.localName}##{event.target.id}"

  beforeFilter: (event, response) ->
    @response = response
    @element = @elify(event, response)
    @params = Transponder.req.objectifyParams()

  runAction: (event, response) =>
    @beforeFilter(event, response)
    if @response.errors
      @errorOut(@response.action)
    else    
      @[event.type.split(':').pop()]()
    @afterFilter(event, response)

  afterFilter: (event, response) ->


  triggerEmpty: (eventName) ->
    console.log "#{eventName} triggered! Override this action in your own presenter"

  triggerEmptyError: (eventName) ->
    console.log "Error #{eventName} triggered! Override this action in your own presenter"

  errorOut: (action) ->
    for key, value of @response.errors
      @error[action](value)

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

  error:
    index: ->
      @triggerEmptyError('Index')
    show: ->
      @triggerEmptyError('Show')
    new: ->
      @triggerEmptyError('New')
    edit: ->
      @triggerEmptyError('Edit')
    update: ->
      @triggerEmptyError('Update')
    create: ->
      @triggerEmptyError('Create')
    destroy: ->
      @triggerEmptyError('Destroy')
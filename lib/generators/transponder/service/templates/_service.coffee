class <%= service_class_name %> extends Transponder.Service
  serviceName: '<%= file_name.downcase %>'
  module: '<%= options[:module_name].downcase %>'

  init: ->
    # how is your service initialized?

  serve: ->
    @init()
    # add your code here
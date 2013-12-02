class <%= presenter_class_name %> extends Transponder.Presenter
  presenterName: '<%= file_name.downcase %>'
  module: '<%= options[:module_name].downcase %>'

  index: ->
    # example
    # @element is the dom element you specified
    # @response is the html fragment rails returned
    # $(@element).html(@response)
    # $(@element).fadeIn(500)
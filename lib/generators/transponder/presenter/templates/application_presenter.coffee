class <%= options[:module_name].camelize %>.Presenters.<%= file_name.camelize %>Presenter extends Transponder.Presenter
  presenterName: '<%= file_name %>'
  module: '<%= options[:module_name] %>'
require 'generators/transponder'

module Transponder
  module Generators
    class PresenterGenerator < Base
      class_option :module_name, type: :string, aliases: '-m', default: 'application'

      def add_presenter
        template "_presenter.coffee", "app/assets/javascripts/#{options[:module_name]}/presenters/#{file_name}_presenter.coffee"
      end

      def add_presenter_to_boot
        insert_into_file "app/assets/javascripts/#{options[:module_name]}/initializers/boot.coffee", 
                         "new #{options[:module_name].camelize}.Presenters.#{file_name.camelize}Presenter()\n",
                         after: "# presenters\n"
      end
    end
  end
end
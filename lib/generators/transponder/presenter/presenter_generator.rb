require 'generators/transponder'

module Transponder
  module Generators
    class PresenterGenerator < Base
      class_option :module_name, type: :string, aliases: '-m', default: 'application'

      def add_presenter
        template "_presenter.coffee", "#{javascripts_path}#{options[:module_name]}/presenters/#{file_name}_presenter.coffee"
      end

      def presenter_class_name
        "#{options[:module_name].camelize}.Presenters.#{file_name.camelize}Presenter"
      end

      def add_presenter_to_boot
        insert_into_file "#{javascripts_path}#{options[:module_name]}/initializers/boot.coffee", 
                         "new #{presenter_class_name}()\n",
                         after: "# presenters\n"
      end
    end
  end
end
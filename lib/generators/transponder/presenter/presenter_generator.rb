require 'generators/transponder'

module Transponder
  module Generators
    class PresenterGenerator < Base
      class_option :module_name, type: :string, aliases: '-m', default: 'application'

      def add_presenter
        presenter_path = File.join(javascripts_path, options[:module_name], "presenters/#{file_name}_presenter.coffee")
        template "_presenter.coffee", presenter_path
      end

      def presenter_class_name
        "#{options[:module_name].camelize}.Presenters.#{file_name.camelize}Presenter"
      end

      def add_presenter_to_boot
        boot_path = File.join(javascripts_path, options[:module_name], 'initializers/boot.coffee')
        puts boot_path
        insert_into_file boot_path, 
                         "new #{presenter_class_name}()\n",
                         after: "# presenters\n"
      end
    end
  end
end
require 'generators/transponder'

module Transponder
  module Generators
    class ServiceGenerator < Base
      class_option :module_name, type: :string, aliases: '-m', default: 'application'
      
      def add_service
        service_path = File.join(javascripts_path, options[:module_name], "services/#{file_name.downcase}.coffee")
        template "_service.coffee", service_path
      end


      def service_class_name
        "#{options[:module_name].camelize}.Services.#{file_name.classify}"
      end

      def add_service_to_boot
        boot_file = File.join(javascripts_path, options[:module_name], 'initializers/boot.coffee')
        insert_into_file boot_file, 
                         "new #{service_class_name}()\n",
                         after: "# services\n"
      end

      def add_service_to_manifest
        manifest_file = File.join(javascripts_path, options[:module_name], 'initializers/manifest.coffee')
        insert_into_file manifest_file, 
                         "$(body).trigger '#{options[:module_name].downcase}:services:#{file_name.downcase}'\n",
                         after: "#{options[:module_name].camelize}.services_manifest = ->\n"
      end
    end
  end
end
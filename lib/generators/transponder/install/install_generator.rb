require 'generators/transponder'

module Transponder
  module Generators
    class InstallGenerator < Base
      class_option :type,   type: :string, default: 'basic', desc: "type of app to generate", aliases: "-t"
      class_option :shared, type: :boolean, default: false

      def base_path(path = nil)
        File.join([javascripts_path, file_name, path].compact)
      end
 
      def create_module
        directory "#{options[:type].downcase}", base_path
      end

      def add_setup
        template "#{options[:type].downcase}_setup.coffee", base_path('initializers/setup.coffee')
      end

      def add_manifest
        template "manifest.coffee", base_path('initializers/manifest.coffee') unless options[:shared]
      end

      def add_shared
        template "#{options[:type].downcase}_shared.coffee", base_path('loader.coffee')
      end

      def add_module_file
        module_file = File.join(javascripts_path, "#{file_name.downcase}.coffee")
        template "application.coffee", module_file unless options[:shared]
      end
    end
  end
end
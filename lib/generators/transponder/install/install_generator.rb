require 'generators/transponder'

module Transponder
  module Generators
    class InstallGenerator < Base
      class_option :type,   type: :string, default: 'basic', desc: "type of app to generate", aliases: "-t"
      class_option :shared, type: :boolean, default: false
 
      def create_module
        directory "#{options[:type]}",     "app/assets/javascripts/#{file_name}"
      end

      def add_setup
        template "#{options[:type]}_setup.coffee", "app/assets/javascripts/#{file_name}/initializers/setup.coffee"
      end

      def add_manifest
        template "manifest.coffee", "app/assets/javascripts/#{file_name}/initializers/manifest.coffee" unless options[:shared]
      end

      def add_shared
        template "#{options[:type]}_shared.coffee", "app/assets/javascripts/#{file_name}/loader.coffee"
      end

      def add_module_file
        template "application.coffee", "app/assets/javascripts/#{file_name}.coffee" unless options[:shared]
      end
    end
  end
end
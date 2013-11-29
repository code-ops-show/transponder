require 'generators/transponder'

module Transponder
  module Generators
    class InstallGenerator < Base
      class_option :type,   type: :string, default: 'basic', desc: "Type of app to generate", aliases: "-t"
      class_option :shared, type: :boolean, default: false
 
      def create_application
        directory "#{type}",     "app/assets/javascripts/#{file_name}"
      end

      def add_setup
        setup_type = options[:full] ? "#{type}_setup" : "#{type}_setup"
        template "#{type}.coffee", "app/assets/javascripts/#{file_name}/initializers/setup.coffee"
      end

      def add_manifest
        template "manifest.coffee", "app/assets/javascripts/#{file_name}/initializers/manifest.coffee" unless options[:shared]
      end

      def add_shared
        template "#{type}_shared.coffee", "app/assets/javascripts/#{file_name}/#{file_name}.coffee" if options[:shared]
      end

      def add_application
        template "#{type}.coffee", "app/assets/javascripts/#{file_name}.coffee" unless options[:shared]
      end
    end
  end
end
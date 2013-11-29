require 'generators/transponder'

module Transponder
  module Generators
    class InstallGenerator < Base
      class_option :full, type: :boolean, default: false
 
      def create_application
        directory 'application',     "app/assets/javascripts/#{file_name}"
      end

      def add_setup
        setup_type = options[:full] ? 'full_setup' : 'basic_setup'
        template "#{setup_type}.coffee", "app/assets/javascripts/#{file_name}/initializers/setup.coffee"
      end

      def add_application
        app_type = options[:full] ? 'full' : 'basic'
        template "#{app_type}.coffee", "app/assets/javascripts/#{file_name}.coffee"
      end
    end
  end
end
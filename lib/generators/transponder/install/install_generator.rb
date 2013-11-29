require 'generators/transponder'

module Transponder
  module Generators
    class InstallGenerator < Base
      class_option :full, type: :boolean, default: false
 
      def create_application
        directory "#{app_type}",     "app/assets/javascripts/#{file_name}"
      end

      def add_setup
        setup_type = options[:full] ? "#{app_type}_setup" : "#{app_type}_setup"
        template "#{setup_type}.coffee", "app/assets/javascripts/#{file_name}/initializers/setup.coffee"
      end

      def add_application
        template "#{app_type}.coffee", "app/assets/javascripts/#{file_name}.coffee"
      end

      def app_type
        options[:full] ? 'full' : 'basic'
      end
    end
  end
end
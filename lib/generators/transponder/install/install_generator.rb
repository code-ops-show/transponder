require 'generators/transponder'

module Transponder
  module Generators
    class InstallGenerator < Base
      def create_application
        directory 'application',     "app/assets/javascripts/#{file_name}"
      end

      def add_application
        template 'application.coffee', "app/assets/javascripts/#{file_name}.coffee"
      end
    end
  end
end
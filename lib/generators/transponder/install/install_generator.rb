require 'generators/transponder'
require 'generators/transponder/resource_helpers'

module Transponder
  module Generators
    class InstallGenerator < Base
      include Transponder::Generators::ResourceHelpers

      def create_application
        directory 'appliation',     'app/assets/javascripts/application'
      end

      def add_application
        template 'application.coffee', "app/assets/javascripts/application.coffee"
      end
    end
  end
end
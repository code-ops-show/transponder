module Transponder
  module Generators
    class InstallGenerator < Base
      def create_services
        directory 'services', 'app/assets/javascripts'
      end

      def create_presenters
        directory 'presenters', 'app/assets/javascripts'
      end

      def create_helpers
        directory 'helpers', 'app/assets/javascripts'
      end

      def add_setup
        template 'setup.js.coffee', "app/assets/javascripts/#{application_name}-setup.js.coffee"
      end 

      def add_manifest
        template 'manifest.js.coffee', "app/assets/javascripts/#{application_name}-manifest.js.coffee"
      end
    end
  end
end
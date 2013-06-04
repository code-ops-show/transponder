module Transponder
  module Generators
    module ResourceHelpers

      def js_app_name
        application_name.downcase
      end

      # gets the application name
      def application_name
        if defined?(Rails) && ::Rails.application
          ::Rails.application.class.name.split('::').first
        else
          "application"
        end
      end

    end
  end
end
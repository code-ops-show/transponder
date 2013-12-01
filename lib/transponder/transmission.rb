module Transponder
  module Transmission
    extend ActiveSupport::Concern

    included do 
      after_filter :intercept_js

      def intercept_js
        if request.format == :js
          response.header['Content-Type'] = "application/transmission"
        end
      end
    end
  end
end
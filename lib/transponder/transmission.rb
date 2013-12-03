module Transponder
  module Transmission
    extend ActiveSupport::Concern

    included do 
      after_filter :intercept_js

      def xms_error message: nil, action: nil
        render json: { errors: message || 'no error message passed', 
                       controller: controller_name, 
                       action: action || action_name, 
                       module: (params[:controller].include?('/') ? params[:controller].split('/')[0] : nil) }, status: :unprocessable_entity
      end

      def intercept_js
        if request.format == :js
          response.header['Content-Type'] = "application/transmission"
        end
      end
    end
  end
end
module Transponder
  module Transmission
    extend ActiveSupport::Concern

    included do 
      after_filter :intercept_js

      def xms_errors object, message: nil
        render json: { errors: (message || object.errors), 
                       controller: controller_name, 
                       action: action_name, 
                       namespace: params[:controller].split('/')[0] }, status: :unprocessable_entity
      end

      def intercept_js
        if request.format == :js
          response.header['Content-Type'] = "application/transmission"
        end
      end
    end
  end
end
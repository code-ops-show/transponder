module Transponder
  module Transmission
    extend ActiveSupport::Concern

    included do 
      after_filter :intercept_js
      helper_method :xms_module_name
    end

    def xms_module_name
      params[:controller].include?('/') ? params[:controller].split('/')[0] : nil
    end


    def xms_error message: nil, action: nil, module_name: nil
      render json: { errors: message || 'no error message passed', 
                     controller: controller_name, 
                     action: action || action_name, 
                     module: module_name || xms_module_name }, status: :unprocessable_entity
    end

    def intercept_js
      if request.format == :js
        response.header['Content-Type'] = "application/transmission"
      end
    end
  end
end
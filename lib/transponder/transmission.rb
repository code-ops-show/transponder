module Transponder
  module Transmission
    extend ActiveSupport::Concern

    included do
      after_action :intercept_js
      helper_method :xms_module_name
    end

    def xms_module_name
      params[:controller].include?('/') ? params[:controller].split('/')[0] : 'application'
    end

    def xms_error_hash(object, message, action, module_name)
      {
        errors: (message || xms_error_partial || object.errors ),
        controller: controller_name,
        action: (action || action_name),
        model_name: object.class.name.downcase,
        id: object.id,
        module: (module_name || xms_module_name)
      }
    end

    def xms_error_partial(module_name: nil, action: nil, controller: nil)
      render_to_string [(module_name || xms_module_name),
                        (controller || controller_name), 'errors'].join('/'), layout: false
    rescue ActionView::MissingTemplate
      nil
    end

    def xms_error  object, message: nil, action: nil, module_name: nil
      render json: xms_error_hash(object, message, action, module_name),
                   status: :unprocessable_entity
    end

    def intercept_js
      if request.format == :js
        response.header['Content-Type'] = "application/transmission"
      end
    end
  end
end

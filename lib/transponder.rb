require 'rails'
require 'active_support'
require 'active_support/dependencies'
require 'active_support/concern'
require 'active_support/log_subscriber'

if ::Rails.version.to_f < 4
  require 'action_view/asset_paths'
end
require 'action_view/helpers' 
require 'action_view/context'
require 'action_view/base'

require 'transponder/version'
require 'transponder/transmission'

module Transponder
  module ViewHelpers
    def xms_module_name
      params[:controller].include?('/') ? params[:controller].split('/')[0] : nil
    end

    def xms_event(module_name: nil, action: nil)
      _module = module_name || xms_module_name || 'application'
      _action = action || action_name
      "ujs:#{_module}:#{controller_name}:#{_action}"
    end
  end

  class Engine < ::Rails::Engine
    ActionView::Base.send :include, Transponder::ViewHelpers
  end
end

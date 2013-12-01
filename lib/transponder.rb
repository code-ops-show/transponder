require 'transponder/version'
require 'transponder/transmission'
require 'rails'

module Transponder
  module ViewHelpers

  end

  class Engine < ::Rails::Engine

  end
end
ActionView::Base.send :include, Transponder::ViewHelpers

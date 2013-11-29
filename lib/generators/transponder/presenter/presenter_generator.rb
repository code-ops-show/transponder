require 'generators/transponder'

module Transponder
  module Generators
    class PresenterGenerator < Base
      class_option :module_name, type: :string, aliases: '-m', default: 'application'

      def add_presenter
        
      end
    end
  end
end
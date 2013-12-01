require 'generators/transponder'

module Transponder
  module Generators
    class PresenterGenerator < Base
      class_option :module_name, type: :string, aliases: '-m', default: 'application'

      def add_presenter
        template "_presenter.coffee", "app/assets/javascripts/#{options[:module_name]}/presenters/#{file_name}_presenter.coffee"
      end
    end
  end
end
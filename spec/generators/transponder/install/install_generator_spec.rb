require 'spec_helper'
require 'generators/transponder/install/install_generator'

describe Transponder::Generators::InstallGenerator do 
  destination File.expand_path("../../../../../tmp", __FILE__)

  before { prepare_destination }

  describe "install default application" do 
    subject { file('app/assets/javascripts/application.coffee') }

    before do 
      run_generator %w(application)
    end

    describe 'application.coffee' do 
      it { should exist }
    end
  end
end
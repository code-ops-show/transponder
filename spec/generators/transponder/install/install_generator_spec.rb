require 'spec_helper'
require 'generators/transponder/install/install_generator'

describe Transponder::Generators::InstallGenerator do 
  destination File.expand_path("../../../../../tmp", __FILE__)

  before { prepare_destination }

  it "should run all tasks" do 
    gen = generator %w(application)
    gen.should_receive :create_module
    gen.should_receive :add_setup
    gen.should_receive :add_manifest
    gen.should_receive :add_shared
    gen.should_receive :add_module_file
    capture(:stdout) { gen.invoke_all }
  end

  describe "install default application" do 
    subject { file('app/assets/javascripts/application.coffee') }

    before do 
      run_generator %w(application)
    end

    describe 'application.coffee' do 
      it { should exist }
      it { should contain /require jquery/ }
      it { should contain /require jquery_ujs/ }
      it { should contain /require turbolinks/ }
      it { should contain /require transponder/ }
    end
  end

  context "content of application directory" do 
    before do 
      run_generator %w(application)
    end

    describe "initializers/setup.coffee" do 
      subject { file('app/assets/javascripts/application/initializers/setup.coffee') }
      it { should exist }
      it { should contain /window.Application/ }
      it { should contain /Helpers/    }
      it { should contain /Services/   }
      it { should contain /Presenters/ }
    end

    describe "initializers/boot.coffee" do 
      subject { file('app/assets/javascripts/application/initializers/boot.coffee') }
      it { should exist }
      it { should contain /presenter/ }
      it { should contain /services/ }
    end

    describe "initializers/manifest.coffee" do 
      subject { file('app/assets/javascripts/application/initializers/manifest.coffee') }
      it { should exist }
      it { should contain /Application.services_manifest/ }
      it { should contain /Application.run_ready/ }
    end
  end
end
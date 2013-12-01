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

  describe "utilities with -t minimal --shared" do 
    before do 
      run_generator %w(utilities -t minimal --shared)
    end

    describe "utilities/initializers/boot.coffee" do 
      subject { file('app/assets/javascripts/utilities/initializers/boot.coffee') }
      it { should exist }
      it { should contain /services/ }
    end

    describe "utilities/initializers/setup.coffee" do 
      subject { file('app/assets/javascripts/utilities/initializers/setup.coffee') }
      it { should exist }
      it { should contain /window.Utilities/ }
      it { should contain /Helpers/    }
      it { should contain /Services/   }
    end

    describe "utilities/utilities.coffee" do 
      subject { file('app/assets/javascripts/utilities/utilities.coffee') }
      it { should exist }
    end
  end

  describe "management with -t full" do 
    before do 
      run_generator %w(management -t full)
    end

    describe "management/initializers/setup.coffee" do 
      subject { file('app/assets/javascripts/management/initializers/setup.coffee') }
      it { should exist }
      it { should contain /window.Management/ }
      it { should contain /Helpers/    }
      it { should contain /Services/   }
      it { should contain /Presenters/ }
      it { should contain /Models/ }
      it { should contain /Collections/ }
      it { should contain /Views/ }
    end

    describe "management/models" do 
      subject { file('app/assets/javascripts/management/models/.keep') }
      it { should exist }
    end

    describe "management/collections" do 
      subject { file('app/assets/javascripts/management/collections/.keep') }
      it { should exist }
    end

    describe "management/views" do 
      subject { file('app/assets/javascripts/management/views/.keep') }
      it { should exist }
    end

    describe "management/templates" do 
      subject { file('app/assets/javascripts/management/templates/.keep') }
      it { should exist }
    end
  end
end
require 'spec_helper'
require 'generators/transponder/service/service_generator'

describe Transponder::Generators::ServiceGenerator do 
  destination File.expand_path("../../../../../tmp", __FILE__)

  before { prepare_destination }

  it "should run all tasks" do 
    gen = generator %w(infinite_scroll)
    gen.should_receive :add_service
    gen.should_receive :add_service_to_boot
    gen.should_receive :add_service_to_manifest
    capture(:stdout) { gen.invoke_all }
  end

  describe "put service in the right place" do 
    subject { file('app/assets/javascripts/application/services/infinite_scroll.coffee') }

    before do 
      FileUtils.cp_r 'spec/fixtures/service/app', destination_root

      run_generator %w(infinite_scroll)
    end

    describe "infinite_scroll.coffee" do 
      it { should exist }
      it { should contain /InfiniteScroll/ }
    end

    describe "add to boot.coffee" do 
      subject { file('app/assets/javascripts/application/initializers/boot.coffee') }
      it { should contain /InfiniteScroll()/ }
    end


    describe "add to manifest.coffee" do 
      subject { file('app/assets/javascripts/application/initializers/manifest.coffee') }
      it { should contain /application:services:infinite_scroll/ }
    end
  end
end
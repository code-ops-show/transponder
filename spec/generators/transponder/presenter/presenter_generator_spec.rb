require 'spec_helper'
require 'generators/transponder/presenter/presenter_generator'

describe Transponder::Generators::PresenterGenerator do 
  destination File.expand_path("../../../../../tmp", __FILE__)

  before { prepare_destination }

  it "should run all tasks" do 
    gen = generator %w(comments)
    gen.should_receive :add_presenter
    gen.should_receive :add_presenter_to_boot
    capture(:stdout) { gen.invoke_all }
  end

  describe "should put presenter in the right place" do 
    subject { file('app/assets/javascripts/application/presenters/comments_presenter.coffee') }
  
    before do 
      FileUtils.cp_r 'spec/fixtures/presenter/app', destination_root

      run_generator %w(comments)
    end

    describe "comments_presenter.coffee" do 
      it { should exist }
      it { should contain /CommentsPresenter/ }
    end

    describe "initializers/boot.coffee" do 
      subject { file('app/assets/javascripts/application/initializers/boot.coffee') }
      it { should contain /CommentsPresenter()/ }
    end
  end
end
describe 'Transponder.Presenter', ->

  describe "instantiate without options", ->
    before ->
      @presenter = new Transponder.Presenter

    it "defaultActions should be Array", ->
      expect(@presenter.actions).to.be.an.instanceof(Array)

    it "should contain 7 default actions", ->
      expect(@presenter.actions).to.include('show')
      expect(@presenter.actions).to.include('index')
      expect(@presenter.actions).to.include('edit')
      expect(@presenter.actions).to.include('update')
      expect(@presenter.actions).to.include('new')
      expect(@presenter.actions).to.include('create')
      expect(@presenter.actions).to.include('destroy')

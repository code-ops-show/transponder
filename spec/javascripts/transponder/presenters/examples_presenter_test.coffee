#= require presenters/examples_presenter

describe "ExamplesPresenter", ->
  before ->
    @presenter = new ExamplesPresenter()

  it "should have presenterName 'examples'", ->
    expect(@presenter.presenterName).to.equal("examples")

  it "should have modelName 'example'", ->
    expect(@presenter.modelName).to.equal("example")

  describe "action trigger", ->
    it "#index", ->
      spy = sinon.spy(@presenter, 'index')

      $(document).trigger('ujs:examples:index', 'blah')
      expect(spy).to.have.been.calledOnce

      spy.restore()

    it "#show", ->
      spy = sinon.spy(@presenter, 'show')

      $(document).trigger('ujs:examples:show', 'blah')
      expect(spy).to.have.been.calledOnce

      spy.restore()

  describe "no action", ->
    it "#new", ->
      spy = sinon.spy(@presenter, 'new')

      $(document).trigger('ujs:examples:new', 'blah')
      expect(spy).to.not.have.been.called

      spy.restore()

  describe "#beforeFilters", ->
    before ->
      @spy = sinon.spy(@presenter, 'beforeFilter')
      $(document).trigger('ujs:examples:index', 'response')

    after ->
      @spy.restore()

    it "should run beforeFilter", ->
      expect(@spy).to.have.been.calledOnce

    it "#response should be 'response'", ->
      expect(@presenter.response).to.equal('response')

    it "#params should be Object", ->
      expect(@presenter.params).to.be.an.instanceof(Object)

  describe "#elify", ->
    it "should run elify", ->
      spy = sinon.spy(@presenter, 'elify')

      $(document).trigger('ujs:examples:index', 'response')
      expect(spy).to.have.been.calledOnce

      spy.restore()

  describe "#afterFilter", ->
    before ->
      @spy = sinon.spy(@presenter, 'afterFilter')
      $(document).trigger('ujs:examples:index', 'response')

    after ->
      @spy.restore()

    it "should run afterFilter", ->
      expect(@spy).to.have.been.calledOnce

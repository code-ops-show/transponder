#= require services/calculate

describe "Calculate", ->
  before ->
    @service = new Calculate()

  it "should have serviceName 'calculate'", ->
    expect(@service.serviceName).to.equal('calculate') 

  describe "#calculate", ->
    before ->
      @service.calculate()

    it "should calculate result", ->
      expect(@service.result).to.equal(400)

  describe "#serve", ->
    before ->
      $('#fixtures').html("<div class='calculate'><span class='result'></span></div>")
      $('#fixtures').trigger('ex:services:calculate')
    after ->
      $('#fixtures').empty()

    it "should calculate the result", ->
      expect($('.calculate')).to.have.class('calculate_active')

    it "should render the result to the span.result", ->
      expect($('span.result').text()).to.equal('400')

#= require services/calculate

describe "Calculate", ->
  before ->
    @service = new Calculate()

  it "should have serviceName 'ex:services:calculate'", ->
    expect(@service.serviceName).to.equal('ex:services:calculate') 

  describe "#calculate", ->
    before ->
      @service.calculate()

    it "should calculate result", ->
      expect(@service.result).to.equal(400)

  describe "#serve", ->
    before (done) ->
      $.ajax
        url: 'fixtures/calculate.html'
        dataType: 'html'
        success: (data, textStatus, jqXhr) ->
          $('#fixtures').append(data)
          $('#fixtures').trigger('ex:services:calculate')
          done()

    after ->
      $('#fixtures').empty()

    it "should calculate the result", ->
      expect($('.calculate')).to.have.class('calculate_active')

    it "should render the result to the span.result", ->
      expect($('span.result').text()).to.equal('400')

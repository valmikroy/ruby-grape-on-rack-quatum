require 'spec_helper'

describe Quantum::API do
  include Rack::Test::Methods

  def app
    Quantum::API
  end

  it 'list' do
    get '/api/matter/particles/fermions/leptons/list'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq({"OK":["electron","muon","tau","electron_neutrino","strange_neutrino","bottom_neutrino"]}.to_json)
  end

  it 'color' do
    get '/api/matter/particles/fermions/leptons/color?type=muon'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq({"OK":"-1"}.to_json)
  end


end

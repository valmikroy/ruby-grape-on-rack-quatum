# frozen_string_literal: true

require 'spec_helper'

describe 'Example', js: true, type: :feature do
  context 'health' do
    it 'health check ' do
      visit '/api/health'
      expect(body).to eq('<html><head></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;">{"OK":"Health ok with debug param false"}</pre></body></html>')
    end
  end
  context 'endpoints' do
    it 'lepton list' do
     visit '/api/matter/particles/fermions/leptons/list'
     expect(body).to eq('<html><head></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;">{"OK":["electron","muon","tau","electron_neutrino","strange_neutrino","bottom_neutrino"]}</pre></body></html>')
    end

  end
end

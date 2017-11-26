# frozen_string_literal: true

require 'spec_helper'

describe 'Example', js: true, type: :feature do
  context 'health' do
    it 'health check ' do
      visit '/api/health'
      expect(body).to eq('<html><head></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;">{"OK":"Health ok with debug param false"}</pre></body></html>')
    end
  end
end

# frozen_string_literal: true

module Quantum
  class Particles::Fermions < Grape::API
    namespace :fermions do
      require 'quantum/fermions'
      helpers Quantum::Helpers::Fermions

      desc <<-HEREDOC
	Particales responsible for mass
      HEREDOC
      get '/spin' do
        ok 200, "#{get_spin} spin"
      end

      # example curl for below endpoint
      # curl -H "Content-Type: application/json"  -X POST -d '{"key1":"value1", "key2":"value2"}'  127.0.0.1:8080/api/matter/particles/fermions
      # curl   -X POST -d   "key1=value1&key2=value2"  127.0.0.1:8080/api/matter/particles/fermions
      post do
        ok 200, "blah #{params['key1']}   #{params['key2']} "
      end

      $LOAD_PATH.unshift(File.expand_path('../fermions', __FILE__))
      require 'quarks'
      mount Quarks

      require 'leptons'
      mount Leptons
    end
  end
end

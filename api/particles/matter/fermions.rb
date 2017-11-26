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

      $LOAD_PATH.unshift(File.expand_path('../fermions', __FILE__))
      require 'quarks'
      mount Quarks

      require 'leptons'
      mount Leptons
    end
  end
end

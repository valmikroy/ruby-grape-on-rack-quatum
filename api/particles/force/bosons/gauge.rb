# frozen_string_literal: true

module Quantum
  class Particles
    class Bosons::Gauge < Grape::API
      namespace :gauge do
        desc <<-HEREDOC
	Force carriers
        HEREDOC
        get '/spin' do
          ok 200, 'Non zero spin'
        end
      end
    end
  end
end

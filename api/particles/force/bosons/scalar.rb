# frozen_string_literal: true

module Quantum
  class Particles
    class Bosons::Scalar < Grape::API
      namespace :scalar do
        desc <<-HEREDOC
	Spooky Force carriers, its parent of Higgs
        HEREDOC
        get '/spin' do
          ok 200, 'zero spin'
        end
      end
    end
  end
end

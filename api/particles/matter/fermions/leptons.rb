# frozen_string_literal: true

module Quantum
  class Particles
    class Fermions::Leptons < Grape::API
      namespace :leptons do
        require 'quantum/fermions'
        helpers Quantum::Helpers::Fermions::Leptons

        params do
          optional :type, type: String, default: ''
        end

        desc <<-HEREDOC
	Particales participation in interaction
        HEREDOC
        get '/interaction' do
          ok 200, "#{get_interaction} Interaction"
        end

        desc <<-HEREDOC
	List all leptons
        HEREDOC
        get '/list' do
          ok 200, list
        end

        desc <<-HEREDOC
	Particales mass
        HEREDOC
        get '/mass' do
          m = exception { get_mass(params[:type]) }
          if m.class.ancestors.include? Exception
            failed m.message.to_s
          else
            ok 200, m.to_s
          end
        end

        desc <<-HEREDOC
	Particales color charge
        HEREDOC
        get '/color' do
          m = exception { get_color_charge(params[:type]) }
          if m.class.ancestors.include? Exception
            failed m.message.to_s
          else
            ok 200, m.to_s
          end
        end
      end
    end
  end
end

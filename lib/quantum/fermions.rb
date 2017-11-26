# frozen_string_literal: true

module Quantum
  module Helpers
    module Fermions
      def get_spin
        '1/2'
      end

      module Quarks
        include Fermions

        def get_color_charge(particle)
          raise 'Provide fermions type in params' if particle.to_s.strip.empty?
          case particle
          when 'up', 'charm', 'top'
            return '2/3'
          when 'down', 'strange', 'bottom'
            return '-1/3'
          else
            raise "Invalid quark #{particle}"
          end
        end

        def get_mass(particle)
          raise 'Provide fermions type in params' if particle.to_s.strip.empty?
          case particle
          when 'up'
            return '2.4 MeV/c^2'
          when 'charm'
            return '1.275 GeV/c^2'
          when 'top'
            return '172.44 GeV/c^2'
          when 'down'
            return '4.8 MeV/c^2'
          when 'strange'
            return '95 MeV/c^2'
          when 'bottom'
            return '4.18 GeV/c^2'
          else
            raise "Invalid quark #{particle}"
          end
        end

        def list
          %w[
            up charm top
            down strange bottom
          ]
        end

        def get_interaction
          'Strong'
        end
      end

      module Leptons
        include Fermions

        def get_color_charge(particle)
          raise 'Provide lepton type in params' if particle.to_s.strip.empty?
          case particle
          when 'electron', 'muon', 'tau'
            return '-1'
          when 'electron_neutrino', 'muon_neutrino', 'tau_neutrino'
            return '0'
          else
            raise "Invalid lepton #{particle}"
          end
        end

        def get_mass(particle)
          raise 'Provide lepton type in params' if particle.to_s.strip.empty?
          case particle
          when 'electron'
            return '0.511 MeV/c^2'
          when 'muon'
            return '105.67 MeV/c^2'
          when 'tau'
            return '1.7768 GeV/c^2'
          when 'electron_neutrino'
            return '< 2.2 eV/c^2'
          when 'muon_neutrino'
            return '< 1.7 MeV/c^2'
          when 'tau_neutrino'
            return '< 15.5 MeV/c^2'
          else
            raise "Invalid lepton #{particle}"
          end
        end

        def list
          %w[
            electron muon tau
            electron_neutrino strange_neutrino bottom_neutrino
          ]
        end

        def get_interaction
          'Electroweak'
        end
      end
    end
  end
end

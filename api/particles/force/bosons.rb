# frozen_string_literal: true

module Quantum
  class Particles::Bosons < Grape::API
    namespace :bosons do
      require 'quantum/bosons'
      helpers Quantum::Helpers::Bosons

      desc <<-HEREDOC
    Particales responsible for force
      HEREDOC
      get '/spin' do
        ok 200, "#{get_spin} spin"
      end

      $LOAD_PATH.unshift(File.expand_path('../bosons', __FILE__))
      require 'gauge'
      mount Gauge

      require 'scalar'
      mount Scalar
    end
  end
end

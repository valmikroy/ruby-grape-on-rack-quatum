# frozen_string_literal: true

module Quantum
  class Particles < Grape::API
    namespace :particles do
      #
      # In general versions are named as 'v1', 'v2', ... but here they are 'matter' and 'force' to keep up with example
      #
      # Versions here are called as part of uri path but
      # they can be setup as param or request header  instead of path
      # https://github.com/ruby-grape/grape#versioning
      #
      version :matter, using: :path, vendor: 'quantum' do
        Dir[File.expand_path('../../api/particles/matter/*.rb', __FILE__)].each do |handler|
          require handler
        end
        mount Fermions
        add_swagger_documentation
      end
      version :force, using: :path, vendor: 'quantum' do
        Dir[File.expand_path('../../api/particles/force/*.rb', __FILE__)].each do |handler|
          require handler
        end
        mount Bosons
        add_swagger_documentation
      end
    end
  end
end

# frozen_string_literal: true

module Quantum
  class App
    def initialize
      @forbidden = ['', 'index.html', '/index.html', '.html']

      @rack_static = ::Rack::Static.new(
        -> { [404, {}, []] },
        root: File.expand_path('../../public', __FILE__),
        urls: ['/']
      )
    end

    def self.instance
      @instance ||= Rack::Builder.new do
        use Rack::Cors do
          allow do
            origins '*'
            resource '*', headers: :any, methods: :get
          end
        end

        # pass on healthcheck control to API
        use Rack::Rewrite do
          rewrite '/health', '/api/health'
        end

        # Rack Timeout setup
        # use Rack::Timeout, service_timeout: 1200, wait_timeout: 1200, wait_overtime: 2400

        run Quantum::App.new
      end.to_app
    end

    def call(env)
      response = Quantum::API.call(env)
    end
  end
end

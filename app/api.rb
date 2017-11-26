# frozen_string_literal: true

require 'grape-swagger'

module Quantum
  class API < Grape::API
    # Formatting for this need to be fixed
    insert_after Grape::Middleware::Formatter, Grape::Middleware::Logger
    format :json

    params do
      optional :debug, type: Boolean, default: false
    end

    before do
      # TODO: this is stray , fix @log  and tie rack logging verbosity with it.
      # @log = loglevel(params[:debug])
    end

    helpers do
      def ok(http_status = 200, msg)
        status http_status
        message('OK', msg)
      end

      def failed(http_status = 404, msg)
        status http_status
        message('FAILED', msg)
      end

      def message(status, msg)
        { status.to_sym => msg }
      end

      def exception
        out = ''
        begin
          out = yield
        rescue Exception => e
          return e
        end
        out
      end
    end

    prefix :api
    mount Quantum::Health
    mount Quantum::Particles
  end
end

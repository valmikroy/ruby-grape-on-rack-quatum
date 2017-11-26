# frozen_string_literal: true

module Quantum
  class Health < Grape::API
    get '/health' do
      ok "Health ok with debug param #{params[:debug]}"
    end
  end
end

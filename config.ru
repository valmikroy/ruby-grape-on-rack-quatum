#!/usr/bin/env ruby
# frozen_string_literal: true

require File.expand_path('../config/environment', __FILE__)
require 'rack/handler/puma'

puma_opts = {
  Host: '0.0.0.0',
  Port: 8080,
  Threads: '4:16',
  Verbose: true
}

Rack::Handler::Puma.run(Quantum::App.instance, puma_opts)

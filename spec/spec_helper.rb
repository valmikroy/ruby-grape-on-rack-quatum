# frozen_string_literal: true

require 'rubygems'

ENV['RACK_ENV'] ||= 'test'

require 'rack/test'

require File.expand_path('../../config/environment', __FILE__)

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation

  config.mock_with :rspec
  config.expect_with :rspec
  config.raise_errors_for_deprecations!
end

require 'capybara/rspec'
Capybara.configure do |config|
  config.app = Quantum::App.new
  config.server_port = 9293
end

# With PhantomJS
# install gem poltergeist - A PhantomJS driver for Capybara
# brew install phantomjs
# for linux copy bin/phantomjs from tar and avoid using broken ubuntu package
# https://github.com/teampoltergeist/poltergeist/issues/866

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

# Capybara.register_driver :chrome do |app|
#  Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end
# Capybara.javascript_driver = :chrome

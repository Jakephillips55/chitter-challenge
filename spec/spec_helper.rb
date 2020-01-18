require 'simplecov'
require 'simplecov-console'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require_relative './test_data_clear.rb'

ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), "..", 'app.rb')
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])

Capybara.app = Chitter

SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    test_data_clear
  end
end

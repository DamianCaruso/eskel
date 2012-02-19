ENV["RACK_ENV"] ||= "test"
require File.expand_path('../init', File.dirname(__FILE__))
require 'rspec'
require 'rack/test'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.mock_with :rspec
end
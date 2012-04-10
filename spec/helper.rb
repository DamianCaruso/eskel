ENV["RACK_ENV"] = "test"
require File.expand_path('../init', File.dirname(__FILE__))
require 'minitest/autorun'

# Custom support files
Dir[root_path('spec/support/**/*.rb')].each { |f| require f }
ENV["RACK_ENV"] = "test"
require File.expand_path('config/boot', File.dirname(File.dirname(__FILE__)))
require 'minitest/autorun'

# Custom support files
Dir[Eskel.root('spec','support','**','*.rb')].each { |f| require f }
ENV['RACK_ENV'] = 'test'
require File.expand_path('../app', File.dirname(__FILE__))

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'capybara/dsl'

# Setup capybara
Capybara.app = Cuba  
Capybara.save_and_open_page_path = APP_ROOT.join('tmp', 'capybara')

# Base class for acceptance tests
class AcceptanceTest < Minitest::Spec
  include Capybara::DSL
end
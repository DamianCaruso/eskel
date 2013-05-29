ENV['RACK_ENV'] = 'test'
require File.expand_path('../main', File.dirname(__FILE__))

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'capybara/dsl'

Capybara.app = Cuba  
Capybara.save_and_open_page_path = Eskel.root('tmp', 'capybara')

class AcceptanceTest < Minitest::Spec
  include Capybara::DSL
end
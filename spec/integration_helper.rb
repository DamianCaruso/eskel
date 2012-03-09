require 'helper'
require 'capybara'
require 'capybara/dsl'

Capybara.app = Cuba  
Capybara.current_driver = :rack_test
include Capybara::DSL
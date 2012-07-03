require 'helper'
require 'capybara'
require 'capybara/dsl'
require Eskel.root('main')

Capybara.app = Cuba  
Capybara.current_driver = :rack_test
include Capybara::DSL
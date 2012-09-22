ENV["RACK_ENV"] = "test"
require File.expand_path("../main", File.dirname(__FILE__))
require "simplecov"
SimpleCov.start

require "minitest/autorun"
require "minitest/pride"

require "capybara/dsl"
if defined? Capybara::DSL
  include Capybara::DSL
else
  include Capybara
end
Capybara.app = Cuba  
Capybara.current_driver = :rack_test
ENV["RACK_ENV"] ||= "test"
require File.expand_path('../init', File.dirname(__FILE__))
require 'minitest/autorun'
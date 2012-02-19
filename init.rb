ROOT_DIR = File.expand_path("../", __FILE__) unless defined? ROOT_DIR
RACK_ENV = ENV["RACK_ENV"] ||= "development" unless defined? RACK_ENV

module Kernel
  private
  def root_path(*args)
    File.join(ROOT_DIR, *args)
  end
end

require "rubygems"
require "bundler"
Bundler.setup(:default, RACK_ENV.to_sym)

$LOAD_PATH.unshift root_path('lib')
require 'eskel'

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

require root_path("app/router")
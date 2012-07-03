ESKEL_ENV  = ENV["RACK_ENV"] ||= "development" unless defined?(ESKEL_ENV)
ESKEL_ROOT = File.expand_path("..", File.dirname(__FILE__))  unless defined?(ESKEL_ROOT)

# Setup bundler
require "rubygems"
require "bundler"
Bundler.setup(:default, ESKEL_ENV.to_sym)

# Set enconding to UTF_8
Encoding.default_internal = Encoding.default_external = Encoding::UTF_8 if defined?(Encoding)

# Require eskel
$LOAD_PATH.unshift File.join(ESKEL_ROOT,"lib")
require "eskel"

# Require initializers
Dir[Eskel.root("config","initializers","**","*.rb")].each { |f| require f }

# Require models
Dir[Eskel.root("models","**","*.rb")].each { |f| require f }
ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR
RACK_ENV = ENV["RACK_ENV"] ||= "development" unless defined? RACK_ENV

require "rubygems"
require "bundler"
Bundler.setup(:default, RACK_ENV.to_sym)
Bundler.require

class Main < Monk::Glue
  set :app_file, __FILE__
  use Rack::Session::Cookie
  
  not_found do
    haml :"404"
  end
end

# Connect to redis database.
Ohm.connect(monk_settings(:redis))

# Load all application files.
Dir[root_path("app/**/*.rb")].each do |file|
  require file
end

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

Main.run! if Main.run?
require 'pathname'
APP_ENV  = ENV['RACK_ENV'] ||= 'development' unless defined?(APP_ENV)
APP_ROOT = Pathname.new(File.expand_path(File.dirname(__FILE__)))  unless defined?(APP_ROOT)

# Setup bundler
require 'rubygems'
require 'bundler'
Bundler.setup(:default, APP_ENV.to_sym)

# Set enconding to UTF_8
Encoding.default_internal = Encoding.default_external = Encoding::UTF_8 if defined?(Encoding)

# Set environment
require 'dotenv'
Dotenv.load(".env.#{APP_ENV}", '.env')

# Load settings
require 'yaml'
$settings = YAML.load_file(APP_ROOT.join('config','settings.yml'))[APP_ENV.to_sym]

# Setup logger
require 'logger'
$logger = begin
  if APP_ENV == 'development'
    logger = Logger.new($stdout)
  else
    logger = Logger.new(APP_ROOT.join('log', "#{APP_ENV}.log"))
  end
  logger.level = Logger.const_get(($settings[:log_level] || :warn).to_s.upcase)
  logger.datetime_format = "%Y-%m-%d %H:%M:%S"
  logger
end

# Add lib directory to load path
$:.unshift APP_ROOT.join('lib')
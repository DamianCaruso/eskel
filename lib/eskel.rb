require 'hashie/mash'
require 'logger'
require 'yaml'

module Eskel
  extend self
  
  def settings
    @settings ||= Hashie::Mash.new(YAML.load_file(root_path("config/settings.yml"))[RACK_ENV])
  end
  
  def logger
    @logger ||= begin
      logger = ::Logger.new(root_path("log/#{RACK_ENV}.log"))
      logger.level = ::Logger.const_get((settings.log_level || :warn).to_s.upcase)
      logger.datetime_format = "%Y-%m-%d %H:%M:%S"
      logger
    end
  end
  
  autoload :Helpers, "eskel/helpers"
end
require 'hashie/mash'
require 'logger'
require 'yaml'

module Eskel
  extend self
  
  def root(*args)
    File.expand_path(File.join(ESKEL_ROOT, *args))
  end
  
  def env
    @env ||= ESKEL_ENV.to_s.downcase.to_sym
  end
  
  def settings
    @settings ||= Hashie::Mash.new(YAML.load_file(root("config","settings.yml"))[env.to_s])
  end
  
  def logger
    @logger ||= begin
      logger = ::Logger.new(root("log","#{env}.log"))
      logger.level = ::Logger.const_get((settings.log_level || :warn).to_s.upcase)
      logger.datetime_format = "%Y-%m-%d %H:%M:%S"
      logger
    end
  end
  
  autoload :Cuba, "eskel/cuba"
end
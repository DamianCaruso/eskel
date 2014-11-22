require 'logger'

STDOUT.sync = true

module Eskel
  module Logging
    def self.stdout_logger
      logger = Logger.new(STDOUT)
      logger.level = Logger.const_get(([ENV['LOG_LEVEL'].to_s.upcase, 'INFO'] & %w[DEBUG INFO WARN ERROR FATAL UNKNOWN]).compact.first)
      logger
    end

    def self.logger
      @_logger ||= stdout_logger
    end

    def self.logger=(logger)
      @_logger = logger
    end

    def logger
      Eskel::Logging.logger
    end
  end
end
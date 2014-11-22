require 'pathname'

require 'eskel/version'
require 'eskel/logging'
require 'eskel/application'
require 'eskel/loader'

module Eskel
  extend Loader
  extend Logging

  class << self
    def root
      Pathname.new(ESKEL_ROOT)
    end

    def env
      @_env ||= (ENV['RACK_ENV'] || 'development').downcase.to_sym
    end

    def groups(*groups)
      groups.unshift(:default, env)
      groups.compact!
      groups.uniq!
      groups
    end
  end
end

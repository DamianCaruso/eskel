require 'cuba'
require 'eskel/application/dependencies'

Cuba.plugin Eskel::ApplicationDependencies
Cuba.plugin Eskel::Logging

module Eskel
  class Application
    def self.require_dependencies
      Cuba.require_dependencies
    end
  end
end
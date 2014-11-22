require 'cuba/render'

module Eskel
  module ApplicationDependencies
    def self.setup(app)
      app.plugin Cuba::Render
      app.settings[:render] ||= {}
      app.settings[:render][:views] = File.expand_path('app/views', Dir.pwd)
    end

    module ClassMethods
      def dependencies
        [
          'helpers/**/*.rb',
          'middleware/**/*.rb',
          'main.rb',
          'routes/**/*.rb'
        ].flat_map { |path| Dir.glob("#{Eskel.root}/app/#{path}") }
      end

      def require_dependencies
        Eskel.require_dependencies(dependencies)
      end
    end
  end
end
module Eskel
  module ApplicationDependencies
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
require 'eskel/pipeline/version'

module Eskel
  class Pipeline
    TYPES = [:stylesheets, :javascripts, :images, :fonts, :static]

    def initialize(root = '.')
      @root = Pathname.new(File.expand_path(root))
      @env  = ENV['RACK_ENV'] || 'development'
    end

    attr_reader :root, :env

    def production?
      !development?
    end

    def development?
      env != 'production'
    end

    def setup_compass
      Compass.configuration.images_path = images.first

      if production?
        Compass.configuration.asset_cache_buster do |path, file|
          {:path => "#{path}/#{version}", :query => nil} if file
        end
      end
    end

    def version
      pipeline_version.read
    end

    def update_version
      pipeline_version.update
    end

    TYPES.each { |type| define_method(type) { paths[type] } }

    def paths
      @paths ||= TYPES.inject({}) do |paths, type|
        paths.merge(type.to_sym => [root.join("app/assets/#{type}").to_s])
      end
    end

  protected

    def pipeline_version
      @pipeline_version ||= Eskel::Pipeline::Version.new(root)
    end
  end
end
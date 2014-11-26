require 'eskel/pipeline'

module Eskel
  module Assets
    def self.setup(app)
      app.settings[:assets] ||= {}
    end

    def asset_path(path)
      return join(path, version) if version
      
      path
    end

    def image_path(path)
      asset_path join('images', path)
    end

    def stylesheet_path(path)
      asset_path join('stylesheets', path)
    end

    def javascript_path(path)
      asset_path join('javascripts', path)
    end

  private

    def join(prefix, path)
      File.join(prefix, path)
    end

    def version
      Eskel::Pipeline.new(Eskel.root.to_path).version
    end
  end
end

Cuba.plugin Eskel::Assets
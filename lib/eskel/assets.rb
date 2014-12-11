require 'eskel/pipeline'
require 'uri'

module Eskel
  module Assets
    def self.setup(app)
      app.settings[:assets] ||= {}
    end

    def asset_path(path)
      path = join(path, version) if version
      host = settings[:assets][:asset_host]

      if host.respond_to?(:call)
        base_url = host.call(path, req)
      else
        base_url = host.to_s
      end

      base_url.empty? ? join('/', path) : URI.join(base_url, path).to_s
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

    def join(*args)
      File.join(*args)
    end

    def version
      Eskel::Pipeline.new(Eskel.root.to_path).version
    end
  end
end

Cuba.plugin Eskel::Assets

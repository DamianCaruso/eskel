module Rack
  module Ext
    class NotFound
      def initialize(app, path)
        @app     = app
        @content = ::File.read(::File.expand_path(path))
      end

      def call(env)
        resp = @app.call(env)
        if 404 == resp[0] && resp[1]['Content-Type'].match(/text\/html/)
          resp = [404, {'Content-Type' => 'text/html; charset=utf-8', 'Content-Length' => @content.size.to_s}, [@content]]
        end
        resp
      end
    end
  end
end
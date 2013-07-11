require 'sprockets-helpers'
require 'uri'

class Cuba
  module Ext
    module Routing
      include Sprockets::Helpers

      def root_path
        @root_path ||= ENV['RELATIVE_URL_ROOT'] || '/'
      end

      def current_path
        @current_path ||= req.fullpath.gsub(/^#{root_path.gsub('/','\/')}(?:\/)?/,'')
      end

      def resource_path(source_path)
        "#{root_path.chomp('/')}/#{source_path.chomp('/')}"
      end

      def asset_path(source, options = {})
        uri = URI.parse(source)
        return source if uri.absolute?

        if options[:debug]
          options[:manifest] = false
          options[:digest] = false
          options[:asset_host] = false
        end

        source_ext = File.extname(source)
        if options[:ext] && source_ext != ".#{options[:ext]}"
          uri.path << ".#{options[:ext]}"
        end

        path = find_asset_path(uri, options)
        if options[:expand] && path.respond_to?(:to_a)
          source_path = path.to_a
        else
          source_path = path.to_s
        end

        case source_path
        when Array
          source_path.map! { |src| resource_path(src) }
        else
          resource_path(source_path)
        end
      end
    end
  end
end
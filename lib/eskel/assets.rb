require 'sass'
require 'sprockets'
require 'sprockets-helpers'
require 'sprockets-sass'
require 'uglifier'

module Eskel
  module Assets

    class << self 
      def environment
        @environment ||= Environment.new(Eskel.root)
      end
    end

    module Helpers
      include Sprockets::Helpers

      def self.included(base)
        Sprockets::Helpers.configure do |c|
          c.environment = Eskel::Assets.environment
          c.expand      = Eskel.env == :development
          c.protocol    = :relative
          c.manifest    = Sprockets::Manifest.new(Eskel::Assets.environment, Eskel.root('public','assets','manifest.json'))
          c.prefix      = '/assets'
          c.digest      = Eskel.settings.assets.digest
          c.public_path = './public'
        end
      end

      def asset_path(source, options = {})
        env['PATH_INFO'].chomp('/') + super(source, options)
      end
    end

    class Environment < Sprockets::Environment
      def initialize(root)
        super(root)
      
        append_path 'assets/images'
        append_path 'assets/javascripts'
        append_path 'assets/stylesheets'
        append_path 'vendor/assets/images'
        append_path 'vendor/assets/javascripts'
        append_path 'vendor/assets/stylesheets'

        if Eskel.settings.assets.compress
          self.js_compressor  = Uglifier.new
          self.css_compressor = Sprockets::Sass::Compressor.new
        end
      end
    end

  end
end
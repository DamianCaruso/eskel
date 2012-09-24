require 'sprockets'
require 'sprockets-helpers'
require 'yui/compressor'

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
          c.manifest    = Sprockets::Manifest.new(Eskel::Assets.environment, Eskel.root('public','assets','manifest.json'))
          c.prefix      = '/assets'
          c.digest      = Eskel.settings.assets.digest
          c.public_path = './public'
        end
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
          self.js_compressor  = YUI::JavaScriptCompressor.new(:munge => true)
          self.css_compressor = YUI::CssCompressor.new
        end

        self.context_class.class_eval do
          include ::Sprockets::Helpers
        end
      end
    end

  end
end
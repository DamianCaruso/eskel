require 'sprockets'

module Eskel
  class Assets < Sprockets::Environment
    def initialize(root)
      super(root)
      
      append_path 'assets/images'
      append_path 'assets/javascripts'
      append_path 'assets/stylesheets'
      append_path 'vendor/assets/images'
      append_path 'vendor/assets/javascripts'
      append_path 'vendor/assets/stylesheets'
    end
  end
end
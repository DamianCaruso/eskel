require File.expand_path('init',      File.dirname(__FILE__))
require File.expand_path('sprockets', File.dirname(__FILE__))

require 'rack'
require 'rack/ext'
require 'rack/methodoverride'
require 'rack/session/cookie'
require 'rack/showexceptions'
require 'cuba'
require 'cuba/contrib'
require 'cuba/ext'
require 'mote'
require 'securerandom'

Cuba.plugin Cuba::Mote
Cuba.plugin Cuba::Prelude
Cuba.plugin Cuba::TextHelpers
Cuba.plugin Cuba::With
Cuba.plugin Cuba::Ext::Helpers
Cuba.plugin Cuba::Ext::Routing

Cuba.use Rack::ShowExceptions if APP_ENV == 'development'
Cuba.use Rack::Ext::TryStatic, :root => APP_ROOT.join('public'), :urls => %w[/]
Cuba.use Rack::MethodOverride
Cuba.use Rack::Session::Cookie, key: "_sess", secret: SecureRandom.hex(64)
Cuba.use Rack::Ext::NotFound, APP_ROOT.join('public', '404.html')

# Require routes
Dir[APP_ROOT.join('routes','**','*.rb')].each { |f| require f }

Cuba.define do
  on 'assets' do
    run $sprockets_env
  end

  on default do
    run Guest
  end
end
require File.expand_path("config/boot", File.dirname(__FILE__))
require 'rack'
require 'rack/eskel'
require 'rack/protection'
require 'cuba'
require 'cuba/render'
require 'eskel/cuba'
require 'eskel/assets'
require 'securerandom'

Cuba.plugin Cuba::Render
Cuba.plugin Eskel::Cuba
Cuba.plugin Eskel::Assets::Helpers

Cuba.use Rack::ShowExceptions if Eskel.env == :development
Cuba.use Rack::Eskel::Middleware::TryStatic, root: Eskel.root("public"), urls: %w[/]
Cuba.use Rack::Runtime
Cuba.use Rack::MethodOverride
Cuba.use Rack::Session::Cookie, key: "_sess", secret: SecureRandom.hex(64)
Cuba.use Rack::Protection
Cuba.use Rack::Head
Cuba.use Rack::ConditionalGet
Cuba.use Rack::ETag
Cuba.use Rack::Eskel::Middleware::NotFound, Eskel.root("public", "404.html")

require 'haml'
Cuba.settings[:render][:template_engine] = "haml"
Cuba.settings[:render][:views] = Eskel.root("views")

# Require subapps
Dir[Eskel.root("apps","**","*.rb")].each { |f| require f }

Cuba.define do
  on "assets" do
    run Eskel::Assets.environment
  end

  on default do
    run Guest
  end
end
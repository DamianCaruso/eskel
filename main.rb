require File.expand_path("config/boot", File.dirname(__FILE__))
require 'rack/protection'
require 'cuba'
require 'cuba/render'
require 'helpers'

Cuba.use Rack::MethodOverride
Cuba.use Rack::Session::Cookie, key: "rack.session", secret: "change_me"
Cuba.use Rack::Protection

Cuba.settings[:views] = Eskel.root("views")
Cuba.settings[:template_engine] = "haml"

Cuba.plugin Helpers
Cuba.plugin Cuba::Render

# Require subapps
Dir[Eskel.root("apps","**","*.rb")].each { |f| require f }

Cuba.define do
  on "api" do
    run API
  end

  on root do
    res.write view("home")
  end
end
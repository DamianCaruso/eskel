require File.expand_path("config/boot", File.dirname(__FILE__))
require 'rack/protection'
require 'cuba'
require 'cuba/render'
require 'helpers'

Cuba.use Rack::MethodOverride
Cuba.use Rack::Session::Cookie, key: "rack.session", secret: "change_me"
Cuba.use Rack::Protection

Cuba.plugin Helpers
Cuba.plugin Cuba::Render

Cuba.settings[:render][:template_engine] = "haml"
Cuba.settings[:render][:views] = Eskel.root("views")

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
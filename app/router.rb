require 'cuba'
require 'cuba/contrib'

Cuba.use Rack::CommonLogger
Cuba.use Rack::Session::Cookie
Cuba.use Rack::Static, urls: ["/css", "/img", "/js"], root: Eskel.root("public")

Cuba.plugin Cuba::Prelude
Cuba.plugin Cuba::Mote
Cuba.plugin Eskel::Cuba

Cuba.settings[:views] = Eskel.root("app","views")

Dir[Eskel.root("app","routes","*.rb")].each { |f| require f }

Cuba.define do
  on "home" do
    run Home
  end
  
  on root do
    redirect "/home"
  end
end

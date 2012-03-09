class Home < Cuba; end

Home.define do
  on get do
    res.write view("home")
  end
end
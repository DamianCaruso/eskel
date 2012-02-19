Home = Cuba.new do
  on get do
    res.write view("home")
  end
end
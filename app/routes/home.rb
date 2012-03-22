class Home < Cuba
  define do
    on root do
      res.write view("home")
    end
  end
end
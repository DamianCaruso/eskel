class API < Cuba; end

API.define do
  on root do
    res.write "api"
  end
end
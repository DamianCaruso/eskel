class API < Cuba; end

API.define do
  res["Content-Type"] = 'application/json'

  on root do
    res.write ""
  end
end
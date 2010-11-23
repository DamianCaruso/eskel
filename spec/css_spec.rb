require "spec_helper"

describe "When renders the default stylesheet" do
  it "content type should be text/css" do
    get '/css/main.css'
    last_response.content_type.should eq("text/css;charset=UTF-8")
  end
end
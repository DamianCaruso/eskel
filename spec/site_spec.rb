require "spec_helper"

describe "As a developer I want to see the homepage so I know this is correctly installed" do
  def app
    Cuba
  end
  
  it "should respond to /home" do
    get '/home'    
    last_response.should be_ok
  end
end
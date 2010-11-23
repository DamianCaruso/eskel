require "spec_helper"

describe "As a developer I want to see the homepage so I know Monk is correctly installed" do
  it "should respond to /" do
    get '/'    
    last_response.should be_ok
  end
end
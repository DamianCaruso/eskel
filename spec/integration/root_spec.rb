require 'integration_helper'

describe "As a developer I want to see the homepage so I know this is correctly installed" do
  it "should respond to /" do
    visit '/'
    page.status_code.must_equal 200
  end
end
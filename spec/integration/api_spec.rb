require 'integration_helper'

describe "API" do
  it "should respond to /api" do
    visit '/api'
    page.status_code.must_equal 200
  end
end
require "helper"

class TestAPI < MiniTest::Unit::TestCase
  describe "api" do
    it "should respond to /api" do
      visit "/api"
      page.status_code.must_equal 200
      page.response_headers["Content-Type"].must_equal "application/json"
    end
  end
end

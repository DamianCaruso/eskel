require "helper"

class TestHome < MiniTest::Unit::TestCase
  describe "home page" do
    it "should respond to /" do
      visit "/"
      page.status_code.must_equal 200
      page.body.must_match /Home/
      page.body.wont_match /default/
    end
  end
end

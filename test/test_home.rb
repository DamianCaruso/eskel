require 'helper'

class TestHomePage < AcceptanceTest
  describe 'when I visit the home page' do
    it 'should respond successfully' do
      visit '/'
      page.status_code.must_equal 200
      page.body.must_match /Home/
    end
  end
end

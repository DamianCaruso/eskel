ENV['RACK_ENV'] = 'test'

require File.expand_path(File.join(File.dirname(__FILE__), "..", "init"))

require "rspec"
require "rack/test"

begin
  puts "Connected to Redis #{Ohm.redis.info[:redis_version]} on #{monk_settings(:redis)[:host]}:#{monk_settings(:redis)[:port]}, database #{monk_settings(:redis)[:db]}."
rescue Errno::ECONNREFUSED
  puts <<-EOS

    Cannot connect to Redis.

    Make sure Redis is running on #{monk_settings(:redis)[:host]}:#{monk_settings(:redis)[:port]}.
    This testing suite connects to the database #{monk_settings(:redis)[:db]}.

    To start the server:
      env RACK_ENV=test monk redis start

    To stop the server:
      env RACK_ENV=test monk redis stop

  EOS
  exit 1
end

Dir["spec/support/**/*.rb"].each {|f| require f}

module Monk
  module Test
    module Methods
      def app
        Main.new
      end
    end
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Monk::Test::Methods
  config.before(:each) { Ohm.flush }
  config.mock_with :rspec
end

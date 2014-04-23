require 'rspec/expectations'
require 'test/unit'
require 'rack/test'

class TestRequestsToBabyCMS < Test::Unit::TestCase
  include Rack::Test::Methods

  def get_without_server(method, route, expectedResult)    # parameterized for GETs and POSTs
    require_relative '../src/BabyCMS1.rb'
    app = BabyCMS.new
    last_response = Rack::MockRequest.new(app).request(method, route)
    last_response.body.should == expectedResult
  end

  def get_with_server(method, route, expectedResult)      # still only GETs
    app = BabyCMS.new
    session = Rack::Test::Session.new(app)
    last_response = session.get "/"
    last_response.body.should == expectedResult
  end

#=================================================
    def test_00_get_without_server
      puts "get without server"
      get_without_server("GET", '/', "Nice GET there. From Alistair")
    end

    def test_01_get_with_server
      puts "get using server"
      get_with_server("GET", '/', "Nice GET there. From Alistair")
    end

end


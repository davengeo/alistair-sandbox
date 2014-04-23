require 'rspec/expectations'
require 'test/unit'
require 'rack/test'
require_relative '../src/BabyCMS1.rb'

class TestRequestsToBabyCMS < Test::Unit::TestCase
  include Rack::Test::Methods

  def get_without_server(app, method, route)    # parameterized for GETs and POSTs
    Rack::MockRequest.new(app).request(method, route)
  end

  def get_with_server(app, method, route)      # still only GETs
    last_response = Rack::Test::Session.new(app).get "/"
  end

#=================================================
    def test_00_get_without_server
      puts "get without server"
      app = BabyCMS.new
      last_response = get_without_server( app, "GET", '/' )
      expectedResult = "Nice GET there. From Alistair"
      last_response.body.should == expectedResult
    end

    def test_01_get_with_server
      puts "get using server"
      app = BabyCMS.new
      last_response = get_with_server( app, "GET", '/')
      expectedResult = "Nice GET there. From Alistair"
      last_response.body.should == expectedResult
    end

end


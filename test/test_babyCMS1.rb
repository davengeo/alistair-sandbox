require 'rspec/expectations'
require 'test/unit'
require 'rack/test'

class TestRequestsToBabyCMS < Test::Unit::TestCase
    include Rack::Test::Methods

  def run_get_without_server(method, route, expectedResult)
    require_relative '../src/BabyCMS1.rb'
    app = BabyCMS.new
    env = Rack::MockRequest.env_for(route, {:method => method})
    response = app.call(env)
    body = response[2].body
    result = body[0]
    result.should == expectedResult
  end

  def run_get_with_server(method, route, expectedResult)
    require 'Sinatra'
    require_relative '../src/served_thru_sinatra'
    def app
      Sinatra::Application
    end
    case method
      when "GET"
        get route
      when "POST"
        post route
    end
    body = last_response.body
    body.should == expectedResult
  end

  def test_00_get_without_server
    run_get_without_server("GET", '/', "Hi from Alistair")
  end

  def test_01_get_with_server
    run_get_with_server("GET", '/', "Hi from Alistair")
  end

end

require 'rspec/expectations'
require 'test/unit'
require 'rack/test'
#require 'Sinatra'
require_relative '../src/BabyCMS.rb'
    require "net/http"
    require "uri"

class TestRequestsToBabyCMS < Test::Unit::TestCase
  include Rack::Test::Methods


  def test_00_hello_without_server
    app = BabyCMS.new
    env = Rack::MockRequest.env_for('/', {})
    response = app.call(env)
    body = response[2].body
    puts body
    body.should == ["Welcome to test_01"]
  end

  def test_01_hello_with_server
  # this scratchpad code doesn't really work the way we want it to.
  # Please replace:
    Rack::Server.start :app => BabyCMS.new

    uri = URI.parse("http://localhost:8080/")
    response = Net::HTTP.get_response(uri)
    puts response

  end

end

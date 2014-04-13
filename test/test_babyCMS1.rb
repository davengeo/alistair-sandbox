require 'rspec/expectations'
require 'test/unit'
require 'rack/test'
#require 'Sinatra'
require_relative '../src/BabyCMS.rb'

class TestRequestsToBabyCMS < Test::Unit::TestCase
  include Rack::Test::Methods


  def test_00_hello
    get '/';
    assert_response :success
=begin
    printf last_response.to_s
    last_response.body.should == "babyCMS"
=end
  end

end

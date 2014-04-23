require 'rspec/expectations'
require 'test/unit'
require 'rack/test'
require_relative '../src/BabyCMS1.rb'

class TestRequestsToBabyCMS < Test::Unit::TestCase
  include Rack::Test::Methods

  def run_without_server(app, method, route, params={})    # parameterized for GETs and POSTs
    aRequest = Rack::MockRequest.new(app)
    aRequest.request(method, route, {:params=>params})
  end

  def run_with_server(app, method, route, params={})      # still only GETs
        aSession = Rack::Test::Session.new(app)
        aSession.request route, {:method=>method}.merge(:params=>params)
  end

# p.s. I don't understand the difference above between MockRequest and Session

#=================================================
    def test_00_get_without_server
      app = BabyCMS.new
      run_without_server( app, "GET", '/blarg', "getKey=getValue").body.should ==
          "Nice GET there. params = {\"getKey\"=>\"getValue\"}. Bests. Alistair."
      run_without_server( app, "POST", '/ook', "postKey=postValue" ).body.should ==
          "Got that POST, baby. params = {\"postKey\"=>\"postValue\"}."
    end

    def test_01_RUN_with_server
      app = BabyCMS.new
      run_with_server( app, "GET", '/sweetie', "getKey=getValue").body.should ==
          "Nice GET there. params = {\"getKey\"=>\"getValue\"}. Bests. Alistair."
      run_with_server( app, "POST", '/narf', "postKey=postValue").body.should ==
          "Got that POST, baby. params = {\"postKey\"=>\"postValue\"}."
      # don't run this next test except to test that it blows up.
      #run_with_server( app, "RUBBISH", '/').body.should == "should just blow up."
    end

end


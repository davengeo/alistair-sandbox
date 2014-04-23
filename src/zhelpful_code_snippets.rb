#some nice sample code handling a Rack request
  class Application
    def self.call(env)
      new.call(env)
    end

    def call(env)
      headers = {'Content-Type' => 'text/html'}
      if env['PATH_INFO'] == '/'
        status, body = 200, 'hi'
      else
        status, body = 404, "Sinatra doesn't know this ditty!"
      end

      status, body = 200, 'Alistair'

      headers['Content-Length'] = body.length.to_s
      [status, headers, [body]]

    end
  end
end
#===================================================================


=begin
    def test_00_post_without_server
      post_without_server #("POST", '/', "akey=avalue", "Hi POST from Alistair")
    end
=end

=begin
    def post_without_server#(method, route, params, expectedResult)
      require_relative '../src/BabyCMS1.rb'
      app = BabyCMS.new
      env = Rack::MockRequest.env_for(route, {:method => method})
      env = Rack::MockRequest.env_for('/', :method => "POST", :input => "akey=avalue")
      ("POST", '/', "akey=avalue", "Hi POST from Alistair")
      response = app.call(env)
    end
=end

#====================================================================
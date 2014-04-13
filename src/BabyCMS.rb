require 'rack'


#require 'Sinatra'
=begin
get '/babyCMS' do
  out = "babyCMS"
end
=end



class BabyCMS
  def call(env)
    request  = Rack::Request.new(env)
    isGet = request.get?

    response = Rack::Response.new
    response['Content-Type'] = 'text/html'
    response.write "Welcome to test_01"
#    response.write 'Hello!' + env["PATH_INFO"]
#    response.write '!Good-bye!' + env.to_s
    response.finish
  end
end


=begin
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
=end

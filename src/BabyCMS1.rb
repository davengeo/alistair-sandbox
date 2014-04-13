require 'rack'
require_relative 'handle_get'

class BabyCMS
  def call(env)
    request  = Rack::Request.new(env)
    if request.get? then handle_get(request); end
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

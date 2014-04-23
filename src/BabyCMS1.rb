require 'rack'

class BabyCMS
  def call(env)
    request  = Rack::Request.new(env)
    if request.get? then
      out = handle_get(request); end
    if request.post? then
      out = handle_post(request); end
    out
  end
end

def handle_get( request )
  params = request.params
  response = Rack::Response.new
  response['Content-Type'] = 'text/html'
  response.write "Nice GET there. "
  response.write "params = #{params}."
  response.write " Bests. Alistair."
  response.finish
end

# send all HTTP POST requests here

def handle_post( request ) # expect Rack::Request, return Rack::Response
  params = request.params
  response = Rack::Response.new
  response['Content-Type'] = 'text/html'
  response.write "Got that POST, baby. "
  response.write "params = #{params}."
  response.finish
end







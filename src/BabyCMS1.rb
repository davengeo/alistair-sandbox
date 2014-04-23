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

def handle_get( req )
puts "in handle get"
  response = Rack::Response.new
  response['Content-Type'] = 'text/html'
  response.write "Nice GET there. From Alistair"
  response.finish
end

# send all HTTP POST requests here

def handle_post( req ) # expect Rack::Request, return Rack::Response
puts "in handle post"
puts "req"
  response = Rack::Response.new
  response['Content-Type'] = 'text/html'
  response.write "Got that POST, baby."
  response.finish
end







# send all HTTP POST requests here
require 'rack'

def handle_post( req ) # expect Rack::Request, return Rack::Response
  response = Rack::Response.new
  response['Content-Type'] = 'text/html'
  response.write "Got that POST, baby."
#  response.write req["PATH_INFO"]
#  response.write '!ciao!' + req.to_s
  response.finish
end




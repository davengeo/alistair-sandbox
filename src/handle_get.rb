# send all HTTP GET requests here
require 'rack'

def handle_get( req ) # expect Rack::Request, return Rack::Response
  response = Rack::Response.new
  response['Content-Type'] = 'text/html'
  response.write "Welcome to test_01"
#    response.write 'Hello!' + req["PATH_INFO"]
#    response.write '!Good-bye!' + req.to_s
  response.finish

end




# send all HTTP GET requests here
require 'rack'

def handle_get( req ) # expect Rack::Request, return Rack::Response
  response = Rack::Response.new
  response['Content-Type'] = 'text/html'
  response.write "Hi from Alistair"
#    response.write 'Hello!' + req["PATH_INFO"]
#    response.write '!Good-bye!' + req.to_s
  response.finish

end




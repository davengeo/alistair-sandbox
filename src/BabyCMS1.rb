require 'rack'
require_relative 'handle_get'

class BabyCMS
  def call(env)
    request  = Rack::Request.new(env)
    if request.get? then handle_get(request); end
  end
end



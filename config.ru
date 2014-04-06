class BabyCMS
  def call(env)
    request  = Rack::Request.new(env)
    isGet = request.get?
    
    response = Rack::Response.new
    response['Content-Type'] = 'text/html'
    response.write 'Hello!' + env["PATH_INFO"]
    response.finish
  end
end

run BabyCMS.new
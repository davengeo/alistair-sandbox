class BabyCMS
  def call(env)
    [200,{"Content-Type"=> "text/html"},["<h1>Hello, BabyCMS!</h1>"]]
  end
end

run BabyCMS.new
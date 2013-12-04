require 'uri'
if Rails.env.production? == false
  redis_host = 'localhost'
  redis_port = 6379
  redis_password = 'foobared'
else
  uri = URI.parse(ENV["REDISTOGO_URL"]) 
  redis_host = uri.host
  redis_port = uri.port
  redis_password = uri.password
end

REDIS = Redis.new( :host => redis_host, :port => redis_port, :password => redis_password )

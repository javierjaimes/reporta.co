redis_host = Rails.application.config.redis_host
redis_port = Rails.application.config.redis_port
redis_password = Rails.application.config.redis_password

REDIS = Redis.new( :host => redis_host, :port => redis_port, :password => redis_password )

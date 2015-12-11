# ActionCable.server.config.redis_path = Rails.root('somewhere/else/cable.yml')
# puts "======================= #{ENV["APP_WEB_URL"]} =========================="

# ActionCable.server.config.allowed_request_origins = ENV.fetch(
#   "APP_WEB_URL", "http://localhost:3000"
# ).split(',')

ActionCable.server.config.disable_request_forgery_protection = true

# Be sure to restart your server when you modify this file.
# puts "=============== #{ENV["APP_SESSION_DOMAIN"]} ===================="
Rails.application.config.session_store :cookie_store, key: '_app_session', domain: ENV.fetch("APP_SESSION_DOMAIN", :all)

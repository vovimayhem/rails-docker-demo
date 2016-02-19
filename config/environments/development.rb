Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :redis_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # By default rails uses some other backend for Active Job...
  # Configure the development queuing backend for Active Job (and separate queues per environment)
  config.active_job.queue_adapter     = :sidekiq
  config.active_job.queue_name_prefix = "demo_#{Rails.env}"

  # Configure access to the web console from
  config.web_console.whitelisted_ips = ENV["WEB_CONSOLE_WHITELISTED_IPS"].split \
    if ENV.key? "WEB_CONSOLE_WHITELISTED_IPS"

  # Actioncable configuration:
  config.action_cable.url = ENV.fetch("APP_CABLE_URL", "ws://localhost:28080")
  config.action_cable.allowed_request_origins = [
    ENV.fetch("APP_WEB_URL", 'http://localhost:3000')
  ]

  # Configure access to the web console from
  config.web_console.whitelisted_ips = ENV["WEB_CONSOLE_WHITELISTED_IPS"].split \
    if ENV.key? "WEB_CONSOLE_WHITELISTED_IPS"
end

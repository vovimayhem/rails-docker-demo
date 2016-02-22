source 'https://rubygems.org'

ruby "2.3.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta2', '< 5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Action Cable dependencies for the Redis adapter
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'bootstrap-sass', '~> 3.3.6'

gem 'devise', '~> 4.0.0-rc1'
gem 'omniauth-twitter', '~> 1.2.1'

# TODO: Keep an eye on https://github.com/redis-store/redis-rails/issues/30,
# and update the reference whenever it's released:
gem 'redis-rails', github: 'redis-store/redis-rails', branch: 'master'
gem 'redis-rack',  github: "schuylr/redis-rack", ref: "a01bfe5a8ee1df4af6c3a886e005896fe711aab7"
gem 'redis-activesupport', github: "claudiob/redis-activesupport", ref: "d83917b3a852a98cd0bee8709ab52e5437f7ca11"
gem 'redis-actionpack', github: "schuylr/redis-actionpack", ref: "b4b37571e3db63cf10713995e7d1ef85e3183b42"

gem 'sidekiq'
# TODO: Keep an eye on https://github.com/mperham/sidekiq/issues/2839, and Sinatra:
gem 'sinatra', github: 'sinatra/sinatra', branch: 'master', require: nil

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

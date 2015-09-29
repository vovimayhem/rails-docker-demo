FROM ruby:2.2.3

ADD . /usr/src/app
WORKDIR /usr/src/app

# Clean up un-needed files:
RUN rm -rf .dockerignore Dockerfile tmp/cache/* tmp/pids/* log/* dev-entrypoint.sh docker-compose.yml *.env .env

# Run a bundler install:
#RUN bundle install --deployment --without development test

# Precompile assets for production:
#RUN RAILS_ENV=production rake assets:precompile

# Default command:
CMD ["rails", "server", "-p", "3000"]

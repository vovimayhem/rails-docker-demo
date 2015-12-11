FROM ruby:2.2.3

ENV RAILS_ENV=production RACK_ENV=production

ADD . /usr/src/app
WORKDIR /usr/src/app

# Clean up un-needed files:
RUN rm -rf .dockerignore Dockerfile tmp/cache/* tmp/pids/* log/* dev-entrypoint.sh docker-compose.yml *.env .env

# Run a bundle install:
RUN bundle install --deployment --without development test

# Precompile assets for production:
# This needs (Why?) some environment variables to be available at build time
# in order not to crash...
RUN DATABASE_URL=postgres://postgres@example.com:5432/fakedb \
  TWITTER_API_KEY=SOME_KEY TWITTER_API_SECRET=SOME_SECRET \
  SECRET_KEY_BASE=10167c7f7654ed02b3557b05b88ece \
  rake assets:precompile

# Expose the following ports:
# - Port 3000 for the Rails web process
# - Port 28080 for the ActionCable WebSocket server (Puma)
EXPOSE 3000 28080

# Default command:
CMD ["bundle", "exec", "puma", "--bind", "tcp://0.0.0.0:3000"]

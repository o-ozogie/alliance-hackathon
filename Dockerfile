FROM ruby:2.5.3

RUN gem install bundler

RUN mkdir h
COPY . h
WORKDIR h

RUN bundle install
ENTRYPOINT bundle exec rackup --port 8888 --host 0.0.0.0

EXPOSE 8888
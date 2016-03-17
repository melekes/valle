FROM ruby:latest

RUN mkdir -p /usr/src/lib
WORKDIR /usr/src/lib

COPY Gemfile* /usr/src/lib/
COPY *.gemspec /usr/src/lib/
RUN bundle install

COPY . /usr/src/lib/

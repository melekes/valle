FROM ruby:2.2.2

RUN mkdir -p /usr/src/lib
WORKDIR /usr/src/lib

COPY Gemfile* /usr/src/lib/
COPY *.gemspec /usr/src/lib/
RUN bundle install

COPY . /usr/src/lib/

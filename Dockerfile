#FROM ubuntu:14.04

FROM ruby:2.3.5
RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs \
  mdns-scan \
  avahi-daemon avahi-utils libavahi-client-dev libavahi-client3 libavahi-common-dev libavahi-compat-libdnssd-dev

RUN mkdir -p /app 
WORKDIR /app

ADD Gemfile* /app/
RUN gem install bundler --pre
RUN bundle install

ADD . /app

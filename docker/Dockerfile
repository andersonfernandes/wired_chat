ARG RUBY_VERSION=3.1.2
FROM ruby:$RUBY_VERSION-alpine

RUN apk add --update --no-cache \
  bash \
  build-base \
  sudo \
  libpq-dev \
  tzdata \
  vips-dev \
  npm

RUN npm install -g yarn

RUN mkdir -p /wired_chat
WORKDIR /wired_chat

RUN gem install bundler

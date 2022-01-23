ARG RUBY_VERSION=3.0.3
FROM ruby:$RUBY_VERSION
ARG DEBIAN_FRONTEND=noninteractive

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get update && apt-get install -y \
      build-essential \
      nodejs \
      yarn \
      locales \
      netcat \
      vim \
      sudo \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

ENV LANG C.UTF-8

RUN mkdir -p /wired_chat && chown $USER:$USER /wired_chat
WORKDIR /wired_chat

RUN gem install bundler

#! /bin/bash
set -e

bundle install
yarn install

[ -e tmp/pids/server.pid ] && rm tmp/pids/server.pid

bundle exec rails db:prepare
bundle exec rails server -p 5000 -b 0.0.0.0

#! /bin/bash
set -e

bundle install
yarn install

bundle exec rails db:prepare
bundle exec rails server -p 5000 -b 0.0.0.0

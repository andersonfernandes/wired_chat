# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', '~> 1.10', '>= 1.10.2', require: false
gem 'interactor-rails', '~> 2.2', '>= 2.2.1'
gem "importmap-rails", "~> 1.1"
gem 'omniauth-google-oauth2', '~> 1.0', '>= 1.0'
gem 'omniauth-rails_csrf_protection', '~> 1.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.6'
gem 'rails', '~> 7.0', '>= 7.0.3'
gem 'redis', '~> 4.5', '>= 4.5.1'
gem 'sass-rails', '>= 6'
gem 'turbo-rails', '~> 1.0', '>= 1.0.1'

group :development, :test do
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
  gem 'pry', '~> 0.14.1'
  gem 'rubocop', '~> 1.25'
  gem 'rubocop-performance', '~> 1.13', '>= 1.13.3'
  gem 'rubocop-rails', '~> 2.13', '>= 2.13.2'
  gem 'rubocop-rspec', '~> 2.9'
end

group :development do
  gem 'annotate', '~> 3.2'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring', '~> 4.0'
  gem 'web-console', '~> 4.2'
end

group :test do
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.2'
  gem 'shoulda-matchers', '~> 5.1'
end

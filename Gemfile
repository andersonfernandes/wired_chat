source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'jbuilder', '~> 2.7'
gem 'omniauth-google-oauth2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.0'
gem 'redis'
gem 'sass-rails', '>= 6'
gem 'turbo-rails', github: 'hotwired/turbo-rails', branch: 'main'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
  gem 'pry', '~> 0.13.1'
  gem 'rubocop', '~> 1.7'
end

group :development do
  gem 'annotate', '~> 3.1'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'factory_bot_rails', '~> 6.1'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'shoulda-matchers', '~> 4.0'
end

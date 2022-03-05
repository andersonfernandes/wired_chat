# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

OmniAuth.config.test_mode = true
google_omniauth_hash = {
  'provider' => 'google_oauth2',
  'uid' => '21321321323132313211',
  'info' => {
    'name' => 'John Doe',
    'email' => 'johndoe@gmail.com',
    'unverified_email' => 'johndoe@gmail.com',
    'email_verified' => true,
    'first_name' => 'John',
    'last_name' => 'Doe',
    'image' => 'http://example/image.jpg'
  },
  'credentials' => {
    'token' => 'asdadsae2qe2e12323b32g3h1g3h21g321h3hj3g21h321g3h21g321j321321hg3jh21g31jhg31j',
    'refresh_token' => 'nsandajdjk2jk4j44j34h2j4j434j3b4j3b4j3b4jb43b43j4jb343j',
    'expires_at' => 1_609_043_279,
    'expires' => true
  }
}

OmniAuth.config.add_mock(:google, google_omniauth_hash)

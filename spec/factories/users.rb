# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    sequence(:email) { |n| "person#{n}@example.com" }
    image_url { 'http://example.com/image.jpg' }
    google_token { 'qwertyuiopasdfghjklzxcvbnm123456' }
    google_refresh_token { nil }

    chats { [] }
    messages { [] }
  end
end

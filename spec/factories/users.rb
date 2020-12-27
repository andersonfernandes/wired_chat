FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 1 }
    image_url { 'http://example.com/image.jpg' }
    google_token { 'qwertyuiopasdfghjklzxcvbnm123456' }
    google_refresh_token { nil }
  end
end

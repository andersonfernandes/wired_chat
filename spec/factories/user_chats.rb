# frozen_string_literal: true

FactoryBot.define do
  factory :user_chat do
    role { :admin }
    user { build(:user) }
    chat { build(:chat) }
  end
end

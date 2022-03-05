# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    text { 'Hi there' }
    seen { false }
    chat { build(:chat) }
    creator { build(:user) }
  end
end

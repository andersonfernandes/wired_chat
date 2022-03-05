# frozen_string_literal: true

FactoryBot.define do
  factory :chat do
    category { :personal }
    name { nil }

    users { [] }
    messages { [] }
  end
end

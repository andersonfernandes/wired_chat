FactoryBot.define do
  factory :message do
    text { 'Hi there' }
    target { build(:user) }
    sender { build(:user) }
  end
end

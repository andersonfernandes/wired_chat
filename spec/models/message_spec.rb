require 'rails_helper'

RSpec.describe Message, type: :model do
  subject { build(:message) }

  describe 'validations' do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:sender) }
    it { should validate_presence_of(:target) }
  end

  describe 'associations' do
    it { should belong_to(:sender) }
    it { should belong_to(:target) }
  end
end

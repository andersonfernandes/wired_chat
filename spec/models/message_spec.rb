# frozen_string_literal: true

describe Message, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_presence_of(:creator) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:creator) }
    it { is_expected.to belong_to(:chat) }
  end
end

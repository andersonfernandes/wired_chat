require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:creator) }
  end

  describe 'associations' do
    it { should belong_to(:creator) }
    it { should belong_to(:chat) }
  end
end

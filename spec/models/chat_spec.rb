require 'rails_helper'

RSpec.describe Chat, type: :model do
  it { should define_enum_for(:category).with_values(%i[personal pool]) }

  describe 'validations' do
    it { should validate_presence_of(:category) }

    context 'name presence on pool chats' do
      subject { described_class.new(category: :pool) }

      it { should validate_presence_of(:name) }
    end
  end

  describe 'associations' do
    it { should have_many(:user_chats) }
    it { should have_many(:users) }
    it { should have_many(:messages) }
  end
end

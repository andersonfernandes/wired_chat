# frozen_string_literal: true

describe Chat, type: :model do
  it { is_expected.to define_enum_for(:category).with_values(%i[personal pool]) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:category) }

    context 'when the name is not present on pool chats' do
      subject { described_class.new(category: :pool) }

      it { is_expected.to validate_presence_of(:name) }
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:user_chats) }
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:messages) }
  end
end

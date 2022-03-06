# frozen_string_literal: true

describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validations' do
    let(:invalid_emails) do
      [
        'plinaddress',
        '#@%^%#$@#$@#.co',
        '@domain.com',
        'Joe Smith <email@domain.com>',
        'email.domain.com',
        'email@domain@domain.com',
        '.email@domain.com',
        'email.@domain.com',
        'email..email@domain.com',
        '„ÅÇ„ÅÑ„ÅÜ„Åà„Åä@domain.com',
        'email@domain.com (Joe Smith)',
        'email@domain',
        'email@-domain.com',
        'email@domain.web',
        'email@111.222.333.44444',
        'email@domain..com'
      ]
    end

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.not_to allow_values(invalid_emails).for(:email) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:user_chats) }
    it { is_expected.to have_many(:chats) }
    it { is_expected.to have_many(:messages) }
  end

  describe '#ordered_chats' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    let(:chat1) { create(:chat, category: :personal) }
    let(:user_chat1) { create(:user_chat, user: user, chat: chat1) }
    let(:user_chat2) { create(:user_chat, user: user1, chat: chat1) }
    let(:chat1_messages) do
      create(:message, chat: chat1, creator: user, created_at: 2.hours.ago)
      create(:message, chat: chat1, creator: user1, created_at: 1.hour.ago)
    end

    let(:chat2) { create(:chat, category: :personal) }
    let(:user_chat3) { create(:user_chat, user: user, chat: chat2) }
    let(:user_chat4) { create(:user_chat, user: user2, chat: chat2) }
    let(:chat2_messages) do
      create(:message, chat: chat2, creator: user2, created_at: 1.minute.ago)
      create(:message, chat: chat2, creator: user2, created_at: 10.hours.ago)
    end

    before do
      user_chat1
      user_chat2
      user_chat3
      user_chat4
      chat1_messages
      chat2_messages
    end

    it do
      expect(user.ordered_chats).to eq([chat2, chat1])
    end
  end
end

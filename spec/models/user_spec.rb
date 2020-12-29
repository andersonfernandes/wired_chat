require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

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

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should_not allow_values(invalid_emails).for(:email) }
  end

  describe 'associations' do
    it { should have_many(:user_chats) }
    it { should have_many(:chats) }
    it { should have_many(:messages) }
  end

  describe '#ordered_chats' do
    let(:user_01) { create(:user) }
    let(:user_02) { create(:user) }

    let(:chat_01) { create(:chat, category: :personal) }
    let(:user_chat_01) { create(:user_chat, user: subject, chat: chat_01) }
    let(:user_chat_02) { create(:user_chat, user: user_01, chat: chat_01) }
    let(:chat_01_messages) do
      create(:message, chat: chat_01, creator: subject, created_at: 2.hours.ago)
      create(:message, chat: chat_01, creator: user_01, created_at: 1.hours.ago)
    end

    let(:chat_02) { create(:chat, category: :personal) }
    let(:user_chat_03) { create(:user_chat, user: subject, chat: chat_02) }
    let(:user_chat_04) { create(:user_chat, user: user_02, chat: chat_02) }
    let(:chat_02_messages) do
      create(:message, chat: chat_02, creator: user_02, created_at: 1.minute.ago)
      create(:message, chat: chat_02, creator: user_02, created_at: 10.hours.ago)
    end

    before do
      user_chat_01
      user_chat_02
      user_chat_03
      user_chat_04
      chat_01_messages
      chat_02_messages
    end

    it do
      expect(subject.ordered_chats).to eq([chat_02, chat_01])
    end
  end
end

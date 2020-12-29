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
end
